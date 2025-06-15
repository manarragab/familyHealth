//import 'dart:core';

import 'dart:core';

import 'package:abg/data/models/family/post_family/post_family_response.dart';
import 'package:abg/data/remote_data/response_model.dart';

class FamilyModel extends ResponseModel<List<Family>?> {
  @override
  List<Family>? data;
  @override
  num? status;
  @override
  String? message;

  FamilyModel({this.data, this.status, this.message});

  FamilyModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Family.fromJson(e)).toList();
    status = json["status"];
    message = json["message"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    if (data != null) {
      jsonData["data"] = data!.map((e) => e.toJson()).toList();
    }
    jsonData["status"] = status;
    jsonData["message"] = message;
    return jsonData;
  }
}


class Family {
  String? image;
  String? name;
  String? birthDate;
  String? phone;
  String? relative;
  int? userId;
  int? id;
  int? age;

  Family(
      {this.image,
        this.name,
        this.birthDate,
        this.phone,
        this.relative,
        this.userId,
        this.id});

  Family.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    name = json["name"];
    birthDate = json["brith_date"];
    phone = json["phone"];
    relative = json["relative"];
    userId = json["user_id"];
    id = json["id"];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{}; // ✅ Renamed to Data
    data["image"] = image;
    data["name"] = name;
    data["brith_date"] = birthDate;
    print("brith_date: $birthDate");
    data["phone"] = phone;
    print("phone: $phone");
    data["relative"] = relative;
    data["user_id"] = userId;
    data["id"] = id;
    data['age'] = age;
    return data;
  }
}


