import 'dart:io';

import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';

class AuthCases {
  DomainData _data;

  AuthCases(this._data);

  LoginModel? getUser() {
    return _data.getUser();
  }

  setUser(LoginModel? loginModel) {
    return _data.setUser(loginModel);
  }

  Future<dynamic> login(String text, String password) {
    return _data.login(text, password);
  }

  Future<ResponseModel<LoginData?>> signOut() {
    return _data.signOut();
  }

  Future<ResponseModel<LoginData?>> getCode(String text) {
    return _data.getCode(text);
  }

  Future<ResponseModel<LoginData?>> checkCode(String code) {
    return _data.checkCode(code);
  }

  Future<ResponseModel<dynamic>> resetPassord(
      {required String code, required String password}) {
    return _data.resetPassord(code: code, password: password);
  }

  Future<ResponseModel<String?>> uploadProfileImage(File file) {
    return _data.uploadProfileImage(file);
  }

  Future<ResponseModel<LoginData?>> editProfile(PostEditProfile profile) {
    return _data.editProfile(profile);
  }
}
