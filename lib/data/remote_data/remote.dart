import 'dart:io';

import 'package:abg/data/const/export.dart' hide MultipartFile;
import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/models/alarm/post_alarms/post_alarm.dart';
import 'package:abg/data/models/alarm/post_alarms/post_alarm_response.dart';
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/auth/users/post_assign_user.dart';
import 'package:abg/data/models/chat/chat_model.dart';
import 'package:abg/data/models/chat/group/post_group_message.dart';
import 'package:abg/data/models/chat/group/sendGroupModel.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_response.dart';
import 'package:abg/data/models/group/group_model.dart';
import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/data/models/social/social_model.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/res/notification/push_notification.dart';
import 'package:dio/dio.dart';

import '../models/family/post_family/post_family_MD.dart';
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
      'device_token': await PushNotificationsManager().getNotificationToken()
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

  Future<ResponseModel<dynamic>> getCode(String text) async {
    Map<String, dynamic> json = {
      'identifier': text,
    };

    sPrint.info(json);

    // return Future.delayed(const Duration(seconds: 1), () {
    //   return LoginModel();
    // });

    return _helper.post<dynamic>(json, path: '/user/forget-password',
        onSuccess: (Map<String, dynamic> data) {
      return ResponseModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, useFormData: false);
  }

  Future<ResponseModel<LoginData?>> checkCode(String code, String email) async {
    return _helper.post<LoginData?>({
      "otp": code,
      "email": email,
    }, path: "/user/verify-otp", onSuccess: (dynamic data) {
      return LoginModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, useFormData: true);
  }

  Future<ResponseModel<dynamic>> resetPassord(
      {required String password}) async {
    return _helper.post<dynamic>(
      {
        "password": password,
        "password_confirmation": password,
      },
      path: "/user/reset-password",
      onSuccess: (dynamic data) {
        return ResponseModel.fromJson(data);
      },
      onError: (data) {
        return ResponseModel(status: data.status, message: data.message);
      },
      useFormData: false,
      isLogin: true,
    );
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

  Future<ResponseModel<HomeData?>> home() async {
    return _helper.get<HomeData?>({}, path: "/user/home",
        onSuccess: (dynamic data) {
      return HomeModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<GroupData?>> groups() async {
    return _helper.get<GroupData?>({}, path: "/user/my-groups",
        onSuccess: (dynamic data) {
      return GroupModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<dynamic>> joinGroup(String id) async {
    return _helper.post<dynamic>({}, path: "/user/groups/join/$id",
        onSuccess: (dynamic data) {
      return ResponseModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<ChatData?>> chatGroup(String id, {int page = 1}) async {
    return _helper.get<ChatData?>({
      "page": page,
    }, path: "/user/chat/group/messages/$id", onSuccess: (dynamic data) {
      return ChatModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<ChatMessage?>> sendChatGroup(
      PostGroupMessage post) async {
    return _helper.post<ChatMessage?>(await post.toJson(),
        path: "/user/chat/sned/message", onSuccess: (dynamic data) {
      return SendGroupModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<LoginData?>> socialLogin(
      SocialModel? socialModel) async {
    //  if (kDebugMode) {
    //    return Future.delayed(const Duration(seconds: 1), () {
    //      return LoginModel.fromJson(loginJS);
    //    });
    //  }
    PushNotificationsManager fcmToken = PushNotificationsManager();
    return _helper.post<LoginData?>(path: '/user/social-login', {
      "social_id": socialModel?.uid,
      "social_type": socialModel?.socialType.name,
      "email": socialModel?.email,
      "fcm_token": await fcmToken.getNotificationToken(),
      "name": socialModel?.name ?? "",
      "image": socialModel?.image,
    }, onSuccess: (Map<String, dynamic> data) {
      return LoginModel.fromJson(data);
    }, onError: (data) {
      sPrint.warning('login error:: $data');
      return LoginModel.fromJson(data);
    });
  }

//alarm

  Future<ResponseModel<List<Alarm>?>> getAlarm() async {
    return _helper.get<List<Alarm>?>({}, path: "/user/alarms",
        onSuccess: (dynamic data) {
      return AlarmModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<Alarm?>> addAlarm(PostAlarm post) async {
    return _helper.post<Alarm?>(await post.toJson(), path: "/user/alarms",
        onSuccess: (dynamic data) {
      return PostAlarmResponse.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<dynamic>> deleteAlarm(int id) async {
    return _helper.delete<dynamic>(
        path: "/user/alarms/$id",
        onSuccess: (dynamic data) {
          return ResponseModel.fromJson(data);
        },
        onError: (data) {
          return ResponseModel(status: data.status, message: data.message);
        },
        isLogin: true);
  }

//family    

  Future<ResponseModel<List<Family>?>> getFamily() async {
    return _helper.get<List<Family>?>({}, path: "/user/family",
        onSuccess: (dynamic data) {
      return FamilyModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<Family?>> addFamily(PostFamilyModel post) async {
    return _helper.post<Family?>(await post.toJson(), path: "/user/family",
        onSuccess: (dynamic data) {
      return PostFamilyResponse.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<dynamic>> deleteFamily(int id) async {
    return _helper.delete<dynamic>(
        path: "/user/family/$id",
        onSuccess: (dynamic data) {
          return ResponseModel.fromJson(data);
        },
        onError: (data) {
          return ResponseModel(status: data.status, message: data.message);
        },
        isLogin: true);
  }
}
