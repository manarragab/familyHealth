
import 'dart:io';

import 'package:abg/data/remote_data/response_model.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
class ResponseRegister  extends ResponseModel<Responsee?> {
  @override
  Responsee? data;
  @override
  num? status;
  @override
  String? message;

  ResponseRegister({this.data, this.status, this.message});

  ResponseRegister.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Responsee.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["data"] = this.data?.toJson();
    data["status"] = status;
    data["message"] = message;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    data["data"] = this.data?.toJson();
    data["token"] = token;
    return data;
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

  RegistResp.fromJson(Map<String, dynamic> json)  {
     final map = <String, dynamic>{};
    if (image != null)  {
      final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream'; // Detect file type
      final mediaType = MediaType.parse(mimeType); // Convert to MediaType
      map['image'] =  MultipartFile.fromFile(image!.path,contentType: mediaType);
    }
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    userType = json["user_type"];
    phone = json["phone"];
    dateOfBirth = json["date_of_birth"];
    gender = json["gender"];
   // image = json["image"];
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
    final Map<String, dynamic> data = <String, dynamic>{};
     if (image != null) {
      final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream'; // Detect file type
      final mediaType = MediaType.parse(mimeType); // Convert to MediaType
      data['image'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
    }
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["email_verified_at"] = emailVerifiedAt;
    data["user_type"] = userType;
    data["phone"] = phone;
    data["date_of_birth"] = dateOfBirth;
    data["gender"] = gender;
    data["longitude"] = longitude;
    data["latitude"] = latitude;
    data["social_id"] = socialId;
    data["social_type"] = socialType;
    data["device_token"] = deviceToken;
    data["is_logged_in"] = isLoggedIn;
    data["is_banned"] = isBanned;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["image_path"] = imagePath;
    return data;
  }
}