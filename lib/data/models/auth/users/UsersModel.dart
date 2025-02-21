import 'package:abg/data/remote_data/response_model.dart';

class UsersModel extends ResponseModel<List<UserData>?> {
  UsersModel({
      this.status, 
      this.success, 
      this.data, 
      this.message,});

  UsersModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(UserData.fromJson(v));
      });
    }
    message = json['message'];
  }
  @override
  num? status;
  bool? success;
  @override
  List<UserData>? data;
  @override
  String? message;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

class UserData {
  UserData({
      this.id, 
      this.name,});

  UserData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}