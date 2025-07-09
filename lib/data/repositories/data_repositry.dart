import 'dart:io';

import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/models/alarm/post_alarms/post_alarm.dart';
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
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_MD.dart';
import 'package:abg/data/models/group/group_model.dart';
import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/data/models/social/social_model.dart';

import '../../domain_data/repositories/domain_repositry.dart';
import '../data_sources/get_storage.dart';
import '../remote_data/remote.dart';
import '../remote_data/response_model.dart';

class DataRepository implements DomainData {
  GetStorageData storage;

  // RemoteFire remoteFire;
  Remote remote;

  DataRepository({
    required this.storage,
    required this.remote,
    //  required this.remoteFire,
  });

// feature authenticate

  @override
  LoginModel? getUser() {
    return storage.getUser();
  }

  @override
  setUser(LoginModel? loginModel) {
    return storage.setUser(loginModel);
  }

  @override
  Future<ResponseModel<dynamic>> getCode(String phone) {
    return remote.getCode(phone);
  }

  @override
  Future login(String phone, String password) {
    return remote.login(phone, password);
  }

  @override
  Future<ResponseModel<LoginData?>> signOut() {
    return remote.signOut();
  }

  @override
  Future<ResponseModel<LoginData?>> checkCode(String code, String email) {
    return remote.checkCode(code, email);
  }

  @override
  Future<ResponseModel> resetPassword({required String password}) {
    return remote.resetPassord(password: password);
  }

  @override
  Future<ResponseModel<LoginData?>> editProfile(PostEditProfile profile) {
    return remote.editProfile(profile);
  }

  @override
  Future<ResponseModel<String?>> uploadProfileImage(File file) {
    return remote.uploadProfileImage(file);
  }

  @override
  Future<ResponseModel> register(PostRegister register) {
    return remote.register(register);
  }

  @override
  Future<ResponseModel<GroupData?>> groups() {
    return remote.groups();
  }

  @override
  Future<ResponseModel<HomeData?>> home() {
    return remote.home();
  }

  @override
  Future<ResponseModel> joinGroup(String id) {
    return remote.joinGroup(id);
  }

  @override
  Future<ResponseModel<ChatData?>> chatGroup(String id, {int page = 1}) {
    return remote.chatGroup(id, page: page);
  }

  @override
  Future<ResponseModel<ChatMessage?>> sendChatGroup(PostGroupMessage post) {
    return remote.sendChatGroup(post);
  }

  @override
  Future<ResponseModel<LoginData?>> socialLogin(SocialModel? socialModel) {
    return remote.socialLogin(socialModel);
  }

  @override
  Future<ResponseModel<AlarmData?>> addAlarm(PostAlarm post) {
    return remote.addAlarm(post);
  }

  @override
  Future<ResponseModel> deleteAlarm(int id) {
    return remote.deleteAlarm(id);
  }

  @override
  Future<ResponseModel<List<AlarmData>?>> getAlarm() {
    return remote.getAlarm();
  }

  @override
  Future<ResponseModel<List<Family>?>> getFamily() {
   return remote.getFamily();
  }

  @override
  Future<ResponseModel<Family?>> addFamily(PostFamilyModel post) {
    return remote.addFamily(post);
  }

  @override
  Future<ResponseModel> deleteFamily(int id) {
    return remote.deleteFamily(id);
  }

  @override
  Future<ResponseModel<BMI?>> addBmi(PostBmiMd post) {
    return remote.addBmi(post);
  }

  @override
  Future<ResponseModel<AlarmData?>> alarmDetails(int id) {
    return remote.alarmDetails(id);
  }

  @override
  Future<ResponseModel<AlarmData?>> updateAlarm(PostAlarm post) {
    return remote.updateAlarm(post);
  }
  
  @override
  Future<ResponseModel<Tracker?>> addTracker(PostTrackerMD post) {
  return remote.addTracker(post);
  }

    @override
  Future<ResponseModel<Diabetes?>> addDiabetes(PostDiabetesMd post) {
  return remote.addDiabetes(post);
  }

      @override
  Future<ResponseModel<IBS?>> addIBS(PostIbsMD post) {
  return remote.addIBS(post);
  }

  
  @override

  Future<ResponseModel<Favourites?>> getFavourites() {
   return remote.getFavourites();
  }

  @override
  Future<ResponseModel<Favourite?>> addFavourites(PostFavourite post) {
    return remote.addFavourites(post);
  }

  @override
  Future<ResponseModel> deleteFavourites(String id) {
    return remote.deleteFavourites(id);
  }
  
    @override
  Future<ResponseModel<Period?>> addPeriod(Postperiod post) {
  return remote.addPeriod(post);
  }
  
  @override
  Future<ResponseModel<User?>> getUserData() {
   return remote.getUserData();
  }
}
