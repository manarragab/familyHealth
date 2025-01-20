import 'dart:io';

import 'package:abg/data/const/export.dart' hide MultipartFile;
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/auth/users/post_assign_user.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/res/notification/push_notification.dart';
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
      'email': text,
      'password': password,
      'device_type': await PushNotificationsManager().getNotificationToken()
    };
    // return Future.delayed(const Duration(seconds: 1), () {
    //   return LoginModel();
    // });

    return _helper.post<LoginData?>(
      json,
      path: '/user/login',
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
      isLogin: false,
    );
  }

  Future<ResponseModel> register(PostRegister register) async {
    return _helper.post<LoginData?>(
      await register.toJson(),
      path: '/user/register',
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
}
