import 'dart:io';

import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/team/TeamModel.dart';
import 'package:abg/data/models/transfer/get_transfer/Transfer.dart';
import 'package:abg/data/models/transfer/trasfer_details/Data.dart';
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

  Future<ResponseModel<List<Transfer>?>> getTransfers({
    int page = 1,
    bool forSale = true,
  });

  Future<ResponseModel<TransferDetails?>> getTransferDetails({
    required String id,
  });

  Future<ResponseModel<List<Transfer>?>> getHistory({int page = 1});

  Future<ResponseModel<LoginData?>> checkCode(String code);
  Future<ResponseModel<dynamic>> resetPassord(
      {required String code, required String password});

  Future<ResponseModel<String?>> uploadProfileImage(File file);
  Future<ResponseModel<LoginData?>> editProfile(PostEditProfile profile);

  ///----------------------------------- team -----------------------------
  Future<ResponseModel<List<TeamDriver>?>> getTeam();
  Future<ResponseModel<List<TeamDriver>?>> searchDriverFromPhone({
    String phone = "",
  });

  Future<ResponseModel<dynamic>> addDriverToCompany({
    required String id,
  });

  Future<ResponseModel<dynamic>> removeDriverFromTeam({
    required String id,
  });

  // get storage

  LoginModel? getUser();

  setUser(LoginModel? loginModel);
}
