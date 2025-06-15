import 'dart:io';

import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/models/alarm/post_alarms/post_alarm.dart';
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
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
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_MD.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_response.dart';
import 'package:abg/data/models/chat/chat_model.dart';
import 'package:abg/data/models/chat/group/post_group_message.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_MD.dart';
import 'package:abg/data/models/group/group_model.dart';
import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/data/models/social/social_model.dart';
import 'package:abg/data/remote_data/response_model.dart';

import '../../data/models/family/post_family/post_family_response.dart';

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

  //alarm

  Future<ResponseModel<List<AlarmData>?>> getAlarm();

  Future<ResponseModel<AlarmData?>> addAlarm(PostAlarm post);

  Future<ResponseModel<dynamic>> deleteAlarm(int id);

  Future<ResponseModel<AlarmData?>> alarmDetails(int id);
  Future<ResponseModel<AlarmData?>> updateAlarm(PostAlarm post);

  //family

  Future<ResponseModel<List<Family>?>> getFamily();

  Future<ResponseModel<Family?>> addFamily(PostFamilyModel post);

 Future<ResponseModel<dynamic>> deleteFamily(int id);

 //calculation

  Future<ResponseModel<BMI?>> addBmi(PostBmiMd post);

  Future<ResponseModel<Tracker?>> addTracker(PostTrackerMD post);

  Future<ResponseModel<Diabetes?>> addDiabetes(PostDiabetesMd post);

  Future<ResponseModel<IBS?>> addIBS(PostIbsMD post);

  Future<ResponseModel<Favourites?>> getFavourites();

  Future<ResponseModel<Favourite?>> addFavourites(PostFavourite post);

 Future<ResponseModel<dynamic>>  deleteFavourites(String id);


  ///----------------------------------- team -----------------------------

  // get storage

  LoginModel? getUser();

  setUser(LoginModel? loginModel);
}
