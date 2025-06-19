import 'dart:convert';
import 'dart:developer';

import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/localization/change_language.dart';
import 'package:abg/res/configuration/print_types.dart';
import 'package:abg/res/injection.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get/utils.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../domain_data/main_getx_controller/main_getx_controller.dart';
import '../../error/dio_exception.dart';
import 'core.dart';

const String MSG = "message";
const String STATUS = 'status';
const String CODE = 'code';
const String NEED_LOGIN = 'needLogin';
const String PHONE = 'phone';

class DioHelper {
  late Response _response;
  static late final Dio _dio;

  static DioHelper init() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return DioHelper();
  }

  LoginModel loginModel = LoginModel();

  Future<bool> checkLogin(bool isLogin) async {
    try {
      if (isLogin) {
        loginModel = sl<AuthCases>().getUser()!;
        sPrint.info('login ::: ${loginModel.data?.toJson()}');
        if (loginModel.token != null) {
          return true;
        } else {
          throw ("login exception from app");
        }
      }
      return true;
    } catch (e, s) {
      sPrint.error(e.toString(), s);
      return false;
    }
  }

  Future<ResponseModel<T>> get<T>(Map<String, dynamic> post,
      {required ResponseModel<T> Function(Map<String, dynamic> data) onSuccess,
      required ResponseModel<T> Function(ResponseModel) onError,
      isLogin = false,
      String path = '',
      Map<String, dynamic> headers = const {}}) async {
    try {
      if (await checkLogin(isLogin)) {
        if (await connectedToNetwork()) {
          _dio.options.connectTimeout =
              const Duration(milliseconds: 10000); //5s
          _dio.options.receiveTimeout = const Duration(milliseconds: 10000);
          sPrint.info('start $post');
          sPrint.info('link ${path.contains('http') ? path : apiUrl() + path}');
          _response =
              await _dio.get(path.contains('http') ? path : apiUrl() + path,
                  queryParameters: post,
                  options: Options(headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    //  "fcm_token": await PushNotificationsManager().getNotificationToken(),
                    "lang": TLang.getCurrentLocale().name,
                    "Accept-Language": TLang.getCurrentLocale().name,
                    // if (isLogin)
                    'Authorization': 'Bearer ${loginModel.token}',
                    ...headers
                  }));
          sPrint.warning(_response.data);
          if ((_response.statusCode == 200 || _response.statusCode == 202||_response.statusCode == 201) && _response.data is! String) {
            Map<String, dynamic> data = {"status": 1};
            sPrint.warning(
                'check if there is data:: ${(_response.data as Map<String, dynamic>).containsKey("data")}');
            if (!(_response.data as Map<String, dynamic>).containsKey("data")) {
              data['data'] = _response.data;
            } else {
              data = {"status": 1, "message": "", ..._response.data};
            }
            return onSuccess(data);
          } else {
            if (_response.data is String) {
              return onError(ResponseModel(
                  status: 0, message: "backend response error in Api $path"));
            }
            return onError(ResponseModel.fromJson(_response.data));
          }
        } else {
          throw ('internet connection error');
        }
      } else {
        return ResponseModel(status: 2, message: 'need to authenticate');
      }
    } catch (error, s) {
      String msg = '';
      if (error is DioException) {
        DioExceptions dioExceptions = DioExceptions.fromDioError(error);
        msg = dioExceptions.message.toString();
        return onError(dioExceptions.message);
      } else {
        sPrint.error(error.toString(), s);
        msg = error.toString();
      }
      sPrint.warning(msg);
      return ResponseModel(status: 0, message: msg);
    }
  }

  Future<ResponseModel<T>> post<T>(Map<String, dynamic> post,
      {required ResponseModel<T> Function(Map<String, dynamic> data) onSuccess,
      required ResponseModel<T> Function(ResponseModel) onError,
      isLogin = false,
      String path = '',
      bool useFormData = true,
      bool userParamter = false}) async {
    try {
      if (await checkLogin(isLogin)) {
        if (await connectedToNetwork()) {
          _dio.options.connectTimeout =
              const Duration(milliseconds: 100000); //5s
          _dio.options.receiveTimeout = const Duration(milliseconds: 100000);
          sPrint.info('start $post');
          sPrint.info('link ${path.contains('http') ? path : apiUrl() + path}');
          _response =
              await _dio.post(path.contains('http') ? path : apiUrl() + path,
                  data: useFormData ? FormData.fromMap(post) : post,
                  queryParameters: userParamter ? post : null,
                  onSendProgress: showProgress,
                  options: Options(headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    //"fcm_token": await PushNotificationsManager().getNotificationToken(),
                    "lang": TLang.getCurrentLocale().name,
                    "Accept-Language": TLang.getCurrentLocale().name,
                    if (isLogin)
                      'Authorization': 'Bearer ${loginModel.token }'
                  }));
          sPrint.warning(
              "${path.contains('http') ? path : apiUrl() + path} \n${_response.data}");
          if ((_response.statusCode == 200 || _response.statusCode == 201) &&
              _response.data is! String) {
            sPrint.success("response in dio: ${_response.data}");
            _response.data['status'] = StatusType.apiSuccess.index;
            return onSuccess(_response.data);
          } else {
            if (_response.data is String) {
              return onError(ResponseModel(
                  status: 0, message: "backend response error in Api $path"));
            }
            if (_response.data is String) {
              return onError(ResponseModel(
                  status: 0, message: "backend response error in Api $path"));
            }
            return onError(ResponseModel.fromJson(_response.data));
          }
        } else {
          throw ('internet connection error');
        }
      } else {
        return ResponseModel(status: 2, message: 'need to authenticate');
      }
    } catch (error, s) {
      sPrint.info(
          'error on link ${path.contains('http') ? path : apiUrl() + path}');
      String msg = '';
      if (error is DioException) {
        DioExceptions dioExceptions = DioExceptions.fromDioError(error);
        msg = dioExceptions.message.toString();
        sPrint.warning(
            'error:: ${dioExceptions.message.status} ::${dioExceptions.message.message}');
        return onError(dioExceptions.message);
      } else {
        sPrint.error(error.toString(), s);
        msg = error.toString();
      }
      sPrint.warning(msg);
      return ResponseModel(status: 0, message: msg);
    }
  }

  Future<ResponseModel<T>> put<T>(
    Map<String, dynamic> post, {
    required ResponseModel<T> Function(Map<String, dynamic> data) onSuccess,
    required ResponseModel<T> Function(ResponseModel) onError,
    isLogin = false,
    String path = '',
  }) async {
    try {
      if (await checkLogin(isLogin)) {
        if (await connectedToNetwork()) {
          _dio.options.connectTimeout =
              const Duration(milliseconds: 10000); //5s
          _dio.options.receiveTimeout = const Duration(milliseconds: 10000);
          sPrint.info('start $post');
          sPrint.info('link ${path.contains('http') ? path : apiUrl() + path}');
          _response =
              await _dio.request(path.contains('http') ? path : apiUrl() + path,
                  data: post,
                  onSendProgress: showProgress,
                  options: Options(method: 'PUT', headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    //  "fcm_token": await PushNotificationsManager().getNotificationToken(),
                    "lang": TLang.getCurrentLocale().name,
                    "Accept-Language": TLang.getCurrentLocale().name,
                    if (isLogin)
                      'Authorization': 'Bearer ${loginModel.token }'
                  }));
          sPrint.warning(_response.data);
          if (_response.data is String) {
            _response.data = jsonDecode(_response.data);
          }
          if (_response.statusCode == 200 && _response.data is! String) {
            sPrint.success("response in dio: ${_response.data}");
            return onSuccess(_response.data);
          } else {
            if (_response.data is String) {
              return onError(ResponseModel(
                  status: 0, message: "backend response error in Api $path"));
            }
            return onError(ResponseModel.fromJson(_response.data));
          }
        } else {
          throw ('internet connection error');
        }
      } else {
        return ResponseModel(status: 2, message: 'need to authenticate');
      }
    } catch (error, s) {
      String msg = '';
      if (error is DioException) {
        DioExceptions dioExceptions = DioExceptions.fromDioError(error);
        msg = dioExceptions.message.toString();
        return onError(dioExceptions.message);
      } else {
        sPrint.error(error.toString(), s);
        msg = error.toString();
      }
      sPrint.warning(msg);
      return ResponseModel(status: 0, message: msg);
    }
  }

  Future<ResponseModel<T>> delete<T>({
    required ResponseModel<T> Function(Map<String, dynamic> data) onSuccess,
    required ResponseModel<T> Function(ResponseModel) onError,
    isLogin = false,
    String path = '',
  }) async {
    try {
      if (await checkLogin(isLogin)) {
        if (await connectedToNetwork()) {
          _dio.options.connectTimeout =
              const Duration(milliseconds: 10000); //5s
          _dio.options.receiveTimeout = const Duration(milliseconds: 10000);
          sPrint.info('link ${path.contains('http') ? path : apiUrl() + path}');
          _response =
              await _dio.request(path.contains('http') ? path : apiUrl() + path,
                  onSendProgress: showProgress,
                  options: Options(method: 'DELETE', headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    // "fcm_token": await PushNotificationsManager().getNotificationToken(),
                    "lang": TLang.getCurrentLocale().name,
                    "Accept-Language": TLang.getCurrentLocale().name,
                    if (isLogin)
                      'Authorization': 'Bearer ${loginModel.token }'
                  }));
          sPrint.warning(_response.data);
          if (_response.statusCode == 200 && _response.data is! String) {
            sPrint.success("response in dio: ${_response.data}");
            return onSuccess(_response.data);
          } else {
            if (_response.data is String) {
              return onError(ResponseModel(
                  status: 0, message: "backend response error in Api $path"));
            }
            return onError(ResponseModel.fromJson(_response.data));
          }
        } else {
          throw ('internet connection error');
        }
      } else {
        return ResponseModel(status: 2, message: 'need to authenticate');
      }
    } catch (error, s) {
      String msg = '';
      if (error is DioException) {
        DioExceptions dioExceptions = DioExceptions.fromDioError(error);
        msg = dioExceptions.message.message.toString();
        return onError(dioExceptions.message);
      } else {
        sPrint.error(error.toString(), s);
        msg = error.toString();
      }
      sPrint.warning(msg);
      return ResponseModel(status: 0, message: msg);
    }
  }
}

void showProgress(received, total) {
  final loadController = Get.find<LoadingGetxController>();
  if (total != -1) {
    String progress = (received / total * 100).toStringAsFixed(0) + "%";
    sPrint.info(progress);
    loadController.setProgress(progress);
  }
}

Future<bool> connectedToNetwork() async {
 // return true;
  bool isInternet = await InternetConnectionChecker.instance.hasConnection;
  if (isInternet) {
    return true;
  } else {
    return false;
  }
}

final dioLoggerInterceptor =
    InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
  String headers = "";
  options.headers.forEach((key, value) {
    headers += "| $key: $value";
  });

  log("┌------------------------------------------------------------------------------");
  log('''| [DIO] Request: ${options.method} ${options.uri}
| ${options.data.toString()}
| Headers:\n$headers''');
  log("├------------------------------------------------------------------------------");
  handler.next(options); //continue
}, onResponse: (Response response, handler) async {
  log("| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}");
  log("└------------------------------------------------------------------------------");
  handler.next(response);
  // return response; // continue
}, onError: (DioException error, handler) async {
  log("| [DIO] Error: ${error.error}: ${error.response.toString()}");
  log("└------------------------------------------------------------------------------");
  handler.next(error); //continue
});
