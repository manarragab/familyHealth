import 'dart:io';

import 'package:abg/data/const/export.dart' hide MultipartFile;
import 'package:abg/data/models/alarm/get_alarms/alarm_details_model.dart';
import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/models/alarm/post_alarms/post_alarm.dart';
import 'package:abg/data/models/alarm/post_alarms/post_alarm_response.dart';
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/auth/users/get_user_data.dart';
import 'package:abg/data/models/auth/users/post_assign_user.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_MD.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_response.dart';
import 'package:abg/data/models/calculation/IBS/post_IBS/post_IBS_MD.dart';
import 'package:abg/data/models/calculation/IBS/post_IBS/post_IBS_response.dart';
import 'package:abg/data/models/calculation/diabetes/post_diabetes/post_diabetes_MD.dart';
import 'package:abg/data/models/calculation/diabetes/post_diabetes/post_diabetes_response.dart';
import 'package:abg/data/models/calculation/favourite/get_favourite/get_favourite.dart';
import 'package:abg/data/models/calculation/favourite/post_favourite/post_favourite.dart';
import 'package:abg/data/models/calculation/favourite/post_favourite/post_favourite_response.dart';
import 'package:abg/data/models/calculation/period/post_period/post_period.dart';
import 'package:abg/data/models/calculation/period/post_period/post_period_response.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_MD.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_response.dart';
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
// Future<ResponseModel<LoginData>> loginn(String text, String password) async {
//   sPrint.info('get data');

//   Map<String, dynamic> json = {
//     'email': text,
//     'password': password,
//     'device_token': await PushNotificationsManager().getNotificationToken(),
//   };

//   return _helper.post<LoginData>(
//     json,
//     path: '/user/login',
//     onSuccess: (data) {
//       sPrint.success(data);
//       sPrint.info('getting data:: $data');

//       final loginModel = LoginModel.fromJson(data);

//       return ResponseModel<LoginData>(
//         status: loginModel.status,
//         message: loginModel.message,
//         data: loginModel.data,
//       );
//     },
//     onError: (error) {
//       sPrint.warning('login error: ${error.message}');
//       return ResponseModel<LoginData>(
//         status: 0,
//         message: error.message,
//       );
//     },
//     useFormData: true,
//     isLogin: false,
//   );
// }

  Future<ResponseModel> login(String text, String password) async {
    try {
      final json = {
        'email': text,
        'password': password,
        'device_token': await PushNotificationsManager().getNotificationToken(),
      };

      return await _helper.post(
        json,
        path: '/user/login',
        onSuccess: (Map<String, dynamic> data) {
          print("🔥 raw response from backend: $data");
          return LoginModel.fromJson(data);
        },
        onError: (data) {
          return LoginModel(
            status: 0,
            message: data.message,
          );
        },
        useFormData: true,
        isLogin: false,
      );
    } catch (e) {
      return ResponseModel<LoginModel?>(
        status: 0,
        message: e.toString(),
      );
    }
  }

  Future<ResponseModel> register(PostRegister register) async {
    return _helper.post<LoginData?>(
      await register.toJson(),
      path: '/user/register',
      onSuccess: (Map<String, dynamic> data) {
        sPrint.success(data);
        sPrint.info('getting data:: $data');
        final loginModel = LoginModel.fromJson(data);
        sPrint.info('register data from remote:: ${loginModel.toJson()}');
        return loginModel;
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
    }, path: "/user/update-profile", onSuccess: (dynamic data) {
      final value = ResponseModel<String>.fromJson(data);
      value.data = data['data']['image_path'];
      return value;
    }, onError: (data) {
      sPrint.warning('error${data.data?.status}:: ${data.data?.msg}');
      return ResponseModel.fromJson(data.toJson());
    }, useFormData: true, isLogin: true);
  }


  Future<ResponseModel<LoginData?>> editProfile(PostEditProfile profile) async {
    return _helper.post<LoginData?>(await profile.toJson(),
        path: "/user/update-profile", onSuccess: (dynamic data) {
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
      return LoginModel.fromJson(data.toJson());
    });
  }

//alarm

  Future<ResponseModel<List<AlarmData>?>> getAlarm() async {
    return _helper.get<List<AlarmData>?>({}, path: "/user/alarms",
        onSuccess: (dynamic data) {
      return AlarmModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<AlarmData?>> alarmDetails(int id) async {
    return _helper.get<AlarmData?>({}, path: "/user/alarms/$id",
        onSuccess: (dynamic data) {
      return AlarmDetailsModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<AlarmData?>> updateAlarm(PostAlarm post) async {
    return _helper.post<AlarmData?>(await post.toJson(),
        path: "/user/alarms/${post.id}?_method=PUT", onSuccess: (dynamic data) {
      return ResponseModel.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<AlarmData?>> addAlarm(PostAlarm post) async {
    return _helper.post<AlarmData?>(await post.toJson(), path: "/user/alarms",
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

  //Calculation=>BMI

  Future<ResponseModel<BMI?>> addBmi(PostBmiMd post) {
    return _helper.post<BMI?>(post.toJson(), path: "/user/bmi-calculator",
        onSuccess: (dynamic data) {
      return PostBMIResponse.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  //calculation => Due date
  Future<ResponseModel<Tracker?>> addTracker(PostTrackerMD post) {
    return _helper.post<Tracker?>(post.toJson(),
        path: "/user/pregnancy/tracker/calculate", onSuccess: (dynamic data) {
      return PostTrackerResponse.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

//calculation => diabetes
  Future<ResponseModel<Diabetes?>> addDiabetes(PostDiabetesMd post) {
    return _helper.post<Diabetes?>(post.toJson(),
        path: "/user/diabetes-calculator", onSuccess: (dynamic data) {
      return PostDiabetesResponse.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

//calculation => IBS
  Future<ResponseModel<IBS?>> addIBS(PostIbsMD post) {
    return _helper.post<IBS?>(
      post.toJson(),
      useFormData: false,
      path: "/user/ibs/symptom-assessment",
      onSuccess: (dynamic data) {
        return PostIbsResponse.fromJson(data);
      },
      onError: (data) {
        return ResponseModel(status: data.status, message: data.message);
      },
      isLogin: true,
    );
  }

  Future<ResponseModel<Favourites?>> getFavourites() async {
    return _helper.get<Favourites?>(
      {},
      path: "/user/favorite-calculators",
      onSuccess: (dynamic data) {
        return GetFavourites.fromJson(data);
      },
      onError: (data) {
        return ResponseModel(status: data.status, message: data.message);
      },
      isLogin: true,
    );
  }

  Future<ResponseModel<Favourite?>> addFavourites(PostFavourite post) async {
    return _helper.post<Favourite?>(post.toJson(),
        path: "/user/favorite-calculators/toggle", onSuccess: (dynamic data) {
      return PostFavouriteResponse.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<dynamic>> deleteFavourites(String id) async {
    return _helper.post<Favourite?>({
      "calculator_name": id,
    }, path: "/user/favorite-calculators/toggle", onSuccess: (dynamic data) {
      return PostFavouriteResponse.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  //calculation => period
  Future<ResponseModel<Period?>> addPeriod(Postperiod post) {
    return _helper.post<Period?>(post.toJson(),
        useFormData: false,
        path: "/user/period-calculator/calculate", onSuccess: (dynamic data) {
      return PostperiodResponse.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }

  Future<ResponseModel<User?>> getUserData() async {
    return _helper.get<User?>({}, path: "/user/data",
        onSuccess: (dynamic data) {
      return GetUserData.fromJson(data);
    }, onError: (data) {
      return ResponseModel(status: data.status, message: data.message);
    }, isLogin: true);
  }
}
