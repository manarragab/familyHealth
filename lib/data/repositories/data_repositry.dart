import 'dart:io';

import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/auth/users/post_assign_user.dart';
import 'package:abg/data/models/chat/chat_model.dart';
import 'package:abg/data/models/chat/group/post_group_message.dart';
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
  Future<ResponseModel<LoginData?>> getCode(String phone) {
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
  Future<ResponseModel<LoginData?>> checkCode(String code) {
    return remote.checkCode(code);
  }

  @override
  Future<ResponseModel> resetPassord(
      {required String code, required String password}) {
    return remote.resetPassord(code: code, password: password);
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
  Future facebookApi(String token, String id) {
    return remote.facebookApi(token, id);
  }

  @override
  Future<ResponseModel<LoginData?>> socialLogin(SocialModel? socialModel) {
    return remote.socialLogin(socialModel);
  }
}
