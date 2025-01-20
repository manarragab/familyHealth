import 'dart:io';

import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/auth/users/post_assign_user.dart';
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

  Future<ResponseModel<LoginData?>> getCode(String phone);

  Future<ResponseModel> register(PostRegister register);

  Future<ResponseModel<LoginData?>> checkCode(String code);
  Future<ResponseModel<dynamic>> resetPassord(
      {required String code, required String password});

  Future<ResponseModel<String?>> uploadProfileImage(File file);
  Future<ResponseModel<LoginData?>> editProfile(PostEditProfile profile);

  ///----------------------------------- team -----------------------------

  // get storage

  LoginModel? getUser();

  setUser(LoginModel? loginModel);
}
