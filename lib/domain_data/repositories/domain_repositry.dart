import 'dart:io';

import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/auth/users/post_assign_user.dart';
import 'package:abg/data/models/chat/chat_model.dart';
import 'package:abg/data/models/chat/group/post_group_message.dart';
import 'package:abg/data/models/group/group_model.dart';
import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/data/models/social/social_model.dart';
import 'package:abg/data/remote_data/response_model.dart';

abstract class DomainData {
  /*
  * this is abstract class to connect your features with data package
  * it will contain methods of all project
  * need to add comment for name of features for all it's methods
  * example::
  * // login feature
  * => loginMethod();
  * => another method();
   */

  // login feature

  // firebase
// Future<bool> checkFirebase();

  // api

/*
  * this is abstract class to connect your features with data package
  * it will contain methods of all project
  * need to add comment for name of features for all it's methods
  * example::
  * // login feature
  * => loginMethod();
  * => another method();
   */

  // login feature

  // api

  Future<dynamic> login(String phone, String password);

  Future<ResponseModel<LoginData?>> signOut();

  Future<ResponseModel<dynamic>> getCode(String phone);

  Future<ResponseModel> register(PostRegister register);

  Future<ResponseModel<LoginData?>> checkCode(String code, String email);

  Future<ResponseModel<dynamic>> resetPassword({required String password});

  Future<ResponseModel<String?>> uploadProfileImage(File file);

  Future<ResponseModel<LoginData?>> editProfile(PostEditProfile profile);

  Future<ResponseModel<HomeData?>> home();

  Future<ResponseModel<GroupData?>> groups();

  Future<ResponseModel<dynamic>> joinGroup(String id);

  Future<ResponseModel<ChatData?>> chatGroup(String id, {int page = 1});

  Future<ResponseModel<ChatMessage?>> sendChatGroup(PostGroupMessage post);

  Future<ResponseModel<LoginData?>> socialLogin(SocialModel? socialModel);

  Future<ResponseModel<List<Alarm>?>> getAlarm(PostGroupMessage post);

  Future<ResponseModel<Alarm?>> addAlarm(PostGroupMessage post);

  Future<ResponseModel<dynamic>> deleteAlarm(int id);

  ///----------------------------------- team -----------------------------

  // get storage

  LoginModel? getUser();

  setUser(LoginModel? loginModel);
}
