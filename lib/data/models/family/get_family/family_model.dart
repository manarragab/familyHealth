//import 'dart:core';

import 'dart:core';

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
  int? id;
  String? name;
  String? image;
  String? relative;
  int? age;

  Family({this.id, this.name, this.image, this.relative, this.age});

  Family.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    relative = json["relative"];
    age = json["age"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{}; // ✅ Renamed to jsonData
    jsonData["id"] = id;
    jsonData["name"] = name;
    jsonData["image"] = image;
    jsonData["relative"] = relative;
    jsonData["age"] = age;
    return jsonData;
  }
}
