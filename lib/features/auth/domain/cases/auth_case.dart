import 'dart:io';

import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/auth/users/post_assign_user.dart';
import 'package:abg/data/models/social/social_model.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';

class AuthCases {
  final DomainData _data;

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

  Future<ResponseModel<dynamic>> getCode(String text) {
    return _data.getCode(text);
  }

  Future<ResponseModel<LoginData?>> checkCode(String code, String email) {
    return _data.checkCode(code, email);
  }

  Future<ResponseModel<dynamic>> resetPassord({required String password}) {
    return _data.resetPassword(password: password);
  }

  Future<ResponseModel<String?>> uploadProfileImage(File file) {
    return _data.uploadProfileImage(file);
  }

  Future<ResponseModel<LoginData?>> editProfile(PostEditProfile profile) {
    return _data.editProfile(profile);
  }

  Future<ResponseModel> register(PostRegister register) {
    return _data.register(register);
  }

  Future<ResponseModel<LoginData?>> socialLogin(SocialModel? socialModel) {
    return _data.socialLogin(socialModel);
  }
}
