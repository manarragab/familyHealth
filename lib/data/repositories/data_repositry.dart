import 'dart:io';

import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/team/TeamModel.dart';
import 'package:abg/data/models/transfer/get_transfer/Transfer.dart';
import 'package:abg/data/models/transfer/trasfer_details/Data.dart';

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
  Future<ResponseModel<TransferDetails?>> getTransferDetails(
      {required String id}) {
    return remote.getTransferDetails(id: id);
  }

  @override
  Future<ResponseModel<List<Transfer>?>> getTransfers(
      {int page = 1, bool forSale = true}) {
    return remote.getTransfers(page: page, forSale: forSale);
  }

  @override
  Future<ResponseModel<List<Transfer>?>> getHistory({int page = 1}) {
    return remote.getHistory(page: page);
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
  Future<ResponseModel<dynamic>> addDriverToCompany({required String id}) {
    return remote.addDriverToCompany(id: id);
  }

  @override
  Future<ResponseModel<List<TeamDriver>?>> getTeam() {
    return remote.getTeam();
  }

  @override
  Future<ResponseModel<dynamic>> removeDriverFromTeam({required String id}) {
    return remote.removeDriverFromTeam(id: id);
  }

  @override
  Future<ResponseModel<List<TeamDriver>?>> searchDriverFromPhone(
      {String phone = ""}) {
    return remote.searchDriverFromPhone(phone: phone);
  }
}
