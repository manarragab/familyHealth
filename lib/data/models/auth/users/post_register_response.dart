
import 'dart:io';

import 'package:abg/data/remote_data/response_model.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
class ResponseRegister  extends ResponseModel<Responsee?> {
  Responsee? data;
  num? status;
  String? message;

  ResponseRegister({this.data, this.status, this.message});

  ResponseRegister.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Responsee.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status"] = status;
    _data["message"] = message;
    return _data;
  }
}

class Responsee {
  int? status;
  String? message;
  RegistResp? data;
  String? token;

  Responsee({this.status, this.message, this.data, this.token});

  Responsee.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : RegistResp.fromJson(json["data"]);
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
}

class RegistResp {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? userType;
  String? phone;
  String? dateOfBirth;
  String? gender;
  File? image;
  dynamic longitude;
  dynamic latitude;
  dynamic socialId;
  dynamic socialType;
  String? deviceToken;
  int? isLoggedIn;
  int? isBanned;
  String? createdAt;
  String? updatedAt;
  String? imagePath;

  RegistResp({this.id, this.name, this.email, this.emailVerifiedAt, this.userType, this.phone, this.dateOfBirth, this.gender, this.image, this.longitude, this.latitude, this.socialId, this.socialType, this.deviceToken, this.isLoggedIn, this.isBanned, this.createdAt, this.updatedAt, this.imagePath});

  RegistResp.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    userType = json["user_type"];
    phone = json["phone"];
    dateOfBirth = json["date_of_birth"];
    gender = json["gender"];
    image = json["image"];
    longitude = json["longitude"];
    latitude = json["latitude"];
    socialId = json["social_id"];
    socialType = json["social_type"];
    deviceToken = json["device_token"];
    isLoggedIn = json["is_logged_in"];
    isBanned = json["is_banned"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    imagePath = json["image_path"];
  }

  Future<Map<String, dynamic>> toJson() async{
    final Map<String, dynamic> _data = <String, dynamic>{};
     if (image != null) {
      final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream'; // Detect file type
      final mediaType = MediaType.parse(mimeType); // Convert to MediaType
      _data['image'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
    }
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["user_type"] = userType;
    _data["phone"] = phone;
    _data["date_of_birth"] = dateOfBirth;
    _data["gender"] = gender;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    _data["social_id"] = socialId;
    _data["social_type"] = socialType;
    _data["device_token"] = deviceToken;
    _data["is_logged_in"] = isLoggedIn;
    _data["is_banned"] = isBanned;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["image_path"] = imagePath;
    return _data;
  }
}