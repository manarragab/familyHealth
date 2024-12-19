import 'dart:io';

import 'package:abg/data/const/export.dart' hide MultipartFile;
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/team/TeamModel.dart';
import 'package:abg/data/models/transfer/get_transfer/Transfer.dart';
import 'package:abg/data/models/transfer/get_transfer/TransferModel.dart';
import 'package:abg/data/models/transfer/trasfer_details/Data.dart';
import 'package:abg/data/models/transfer/trasfer_details/TransferDataModel.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:dio/dio.dart';

import 'dio_helper.dart';

class Remote {
  final DioHelper _helper;

  Remote(this._helper);

  // feature authenticate

  Future<ResponseModel> login(String text, String password) async {
    sPrint.info('get data');
    bool isPhoneNumber = GetUtils.isPhoneNumber(text);
    Map<String, dynamic> json = {
      'phone': text,
      'phone_code': "90",
      "password": password,
      "platform": Platform.isAndroid ? "android" : "ios",
      //  "fcm_token": await PushNotificationsManager().getNotificationToken()
    };
    // return Future.delayed(const Duration(seconds: 1), () {
    //   return LoginModel();
    // });

    return _helper.post<LoginData?>(
      json,
      path: '/login',
      onSuccess: (Map<String, dynamic> data) {
        sPrint.success(data);
        sPrint.info('getting data:: $data');
        return LoginModel.fromJson(data);
      },
      onError: (data) {
        sPrint.warning('error  ${data.data?.status}:: ${data.message}');
        return ResponseModel(status: 0, message: "${data.message}");
      },
      useFormData: true,
      userParamter: true,
      isLogin: false,
    );
  }

  Future<ResponseModel<LoginData?>> getCode(String text) async {
    sPrint.info('get data');
    bool isPhoneNumber = GetUtils.isPhoneNumber(text);
    Map<String, dynamic> json = {
      if (!isPhoneNumber) 'email': text,
      if (isPhoneNumber) 'mobile': text,
      //   "fcm_token": await PushNotificationsManager().getNotificationToken(),
    };

    sPrint.info(json);

    // return Future.delayed(const Duration(seconds: 1), () {
    //   return LoginModel();
    // });

    return _helper.post<LoginData?>(json, path: '/host/password/forgot',
        onSuccess: (Map<String, dynamic> data) {
      return LoginModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, useFormData: false);
  }

  Future<ResponseModel<LoginData?>> checkCode(String code) async {
    return _helper.get<LoginData?>({
      "reset_code": code,
    }, path: "/password/reset", onSuccess: (dynamic data) {
      return LoginModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    });
  }

  Future<ResponseModel<dynamic>> resetPassord(
      {required String code, required String password}) async {
    return _helper.post<dynamic>({
      "reset_code": code,
      "new_password": password,
    }, path: "/store_password/reset", onSuccess: (dynamic data) {
      return ResponseModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, useFormData: false);
  }

  Future<ResponseModel<String?>> uploadProfileImage(File file) async {
    return _helper.post<String?>({
      "image": await MultipartFile.fromFile(file.path),
    }, path: "/uploadProfileImage", onSuccess: (dynamic data) {
      final value = ResponseModel<String>.fromJson(data);
      value.data = data['data']['image'];
      return value;
    }, onError: (data) {
      sPrint.warning('error${data.data?.status}:: ${data.data?.msg}');
      return ResponseModel.fromJson(data.toJson());
    }, useFormData: true, isLogin: true);
  }

  Future<ResponseModel<LoginData?>> editProfile(PostEditProfile profile) async {
    return _helper.post<LoginData?>(profile.toJson(), path: "/editProfile",
        onSuccess: (dynamic data) {
      return LoginModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, useFormData: true, isLogin: true);
  }

  Future<ResponseModel<LoginData?>> signOut() async {
    return _helper.post<LoginData?>({}, path: "/auth/logout",
        onSuccess: (dynamic data) {
      return LoginModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, useFormData: true, isLogin: true);
  }

  Future<ResponseModel<List<Transfer>?>> getTransfers({
    int page = 1,
    bool forSale = false,
  }) async {
    return _helper.get<List<Transfer>?>({
      "page": page,
      "for_sale": forSale ? 1 : 0,
    }, path: "/transfers", onSuccess: (dynamic data) {
      return TransferModel.fromJson(data);
    }, onError: (data) {
      sPrint.warning('error${data.data?.status}:: ${data.data?.msg}');
      return ResponseModel(status: data.status ?? 0, message: data.data?.msg);
    }, isLogin: true);
  }

  Future<ResponseModel<List<Transfer>?>> getHistory({
    int page = 1,
  }) async {
    return _helper.get<List<Transfer>?>({
      "page": page,
    }, path: "/transfers/history", onSuccess: (dynamic data) {
      return TransferModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<TransferDetails?>> getTransferDetails({
    required String id,
  }) async {
    return _helper.get<TransferDetails?>({}, path: "/transfers/show/$id",
        onSuccess: (dynamic data) {
      return TransferDetailsModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<List<TeamDriver>?>> getTeam() async {
    return _helper.get<List<TeamDriver>?>({}, path: "/drivers-of-company",
        onSuccess: (dynamic data) {
      return TeamModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<List<TeamDriver>?>> searchDriverFromPhone({
    String phone = "",
  }) async {
    return _helper.post<List<TeamDriver>?>(
        {if (phone.isNotEmpty) "phone": phone}, path: "/search-driver",
        onSuccess: (dynamic data) {
      return TeamModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<TransferDetails?>> addDriverToCompany({
    required String id,
  }) async {
    return _helper.get<TransferDetails?>({}, path: "/add-driver-to-company/$id",
        onSuccess: (dynamic data) {
      return ResponseModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<TransferDetails?>> removeDriverFromTeam({
    required String id,
  }) async {
    return _helper.get<TransferDetails?>({},
        path: "/delete-driver-from-company/$id", onSuccess: (dynamic data) {
      return ResponseModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }
}
