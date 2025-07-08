import 'dart:io';

import 'package:abg/data/const/export.dart';
import 'package:abg/data/remote_data/response_model.dart';


import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';


// class LoginModel extends ResponseModel<LoginData?> {
//   LoginModel({
//     this.status,
//     this.msg,
//     this.data,
//   });

//   LoginModel.fromJson(Map<String,dynamic> json) {
//     status = json['status'];
//     msg = json["message"];
//     data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
//     if (data != null && json['token'] != null) {
//       data?.deviceToken = json['token'];
//     }
//   }

//   @override
//   num? status;
//   String? msg;
//   @override
//   LoginData? data;

//   @override
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     map["message"] = msg;
//     if (data != null) {
//       map['data'] = data?.toJson();
//     }
//     return map;
//   }
// }

// class LoginData {
//   LoginData({
//     this.id,
//     this.name,
//     this.email,
//     this.emailVerifiedAt,
//     this.userType,
//     this.academicYear,
//     this.phone,
//     this.image,
//     this.deviceToken,
//     this.isLoggedIn,
//     this.isBanned,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? id;
//   String? name;
//   String? email;
//   String? emailVerifiedAt;
//   String? userType;
//   String? academicYear;
//   String? phone;
//   String? image;

//   String? deviceToken;
//   int? isLoggedIn;
//   int? isBanned;
//   String? createdAt;
//   String? updatedAt;

//   LoginData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     emailVerifiedAt = null;
//     userType = json['user_type'];
//     academicYear = null;
//     phone = json['phone'];
//     image = json['image_path'];
//     deviceToken = json['token'];
//     isLoggedIn = json['is_logged_in'];
//     isBanned = json['is_banned'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     print("nameeeeee : $name");
//     data['email'] = email;
//     data['email_verified_at'] = emailVerifiedAt;
//     data['user_type'] = userType;
//     data['academic_year'] = academicYear;
//     data['phone'] = phone;
//     data['image_path'] = image;
//     data['token'] = deviceToken;
//     data['is_logged_in'] = isLoggedIn;
//     data['is_banned'] = isBanned;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

class LoginModel extends ResponseModel<LoginData?> {
  @override
  LoginData? data;
  @override
  num? status;
  @override
  String? message;
  String? token;

  LoginModel({this.data, this.status, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : LoginData.fromJson(json["data"]);
    sPrint.info('data from keys :: ${json.keys}');
    status = json["status"];
    message = json["message"];
   token = json["token"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (data != null) {
      data["data"] = data?.toJson();
    }
    data["status"] = status;
    data["message"] = message;
   data["token"] = token;

    return data;
  }
}

class LoginData {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? userType;
  String? phone;
  String? dateOfBirth;
  String? gender;
  String? image;
  dynamic longitude;
  dynamic latitude;
  dynamic socialId;
  dynamic socialType;
  String? deviceToken;
  int? isLoggedIn;
  int? isBanned;
  String? createdAt;
  String? updatedAt;

  LoginData({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.userType,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.image,
    this.longitude,
    this.latitude,
    this.socialId,
    this.socialType,
    this.isLoggedIn,
    this.isBanned,
    this.createdAt,
    this.updatedAt,
  });

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    userType = json["user_type"];
    phone = json["phone"];
    dateOfBirth = json["date_of_birth"];
    gender = json["gender"];
    longitude = json["longitude"];
    latitude = json["latitude"];
    socialId = json["social_id"];
    socialType = json["social_type"];
    deviceToken = json["device_token"];
    isLoggedIn = json["is_logged_in"];
    isBanned = json["is_banned"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    image = json["image_path"];
  }

 Map<String, dynamic> toJson()  {
    final Map<String, dynamic> data = <String, dynamic>{};


// if (image != null) {
//       final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream'; // Detect file type
//       final mediaType = MediaType.parse(mimeType); // Convert to MediaType
//       _data['image_path'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
//     }


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
    data["image_path"] = image;
        print("image_path:?????????????????????????????????????? $image");

    return data;
  }
}


// class LoginModel extends ResponseModel<LoginData?> {
//   LoginData? data;
//   num? status;
//   String? message;

//   LoginModel({this.data, this.status, this.message});

  
// LoginModel.fromJson(Map<String, dynamic> json) {
//   sPrint.info('LoginModel.fromJson - raw json["data"]: ${json["data"]}');
//   data = json["data"] == null ? null : LoginData.fromJson(json["data"]);
//   sPrint.info('LoginModel.fromJson - parsed data: ${data?.toJson()}');
//   status = json["status"];
//   message = json["message"];
// }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     if(data != null) {
//       _data["data"] = data?.toJson();
//     }
//     _data["status"] = status;
//     _data["message"] = message;
//     return _data;
//   }
// }

// class LoginData {
//   num? status;
//   String? message;
//   Info? data;
//   String? token;

//   LoginData({this.status, this.message, this.data, this.token});

//   LoginData.fromJson(Map<String, dynamic> json) {
//     status = json["status"];
//     message = json["message"];
//     data = json["data"] == null ? null : Info.fromJson(json["data"]);
//     token = json["token"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["status"] = status;
//     _data["message"] = message;
//     if(data != null) {
//       _data["data"] = data?.toJson();
//     }
//     _data["token"] = token;
//     return _data;
//   }
// }

// class Info {
//   int? id;
//   String? name;
//   String? email;
//   dynamic emailVerifiedAt;
//   String? userType;
//   String? phone;
//   String? dateOfBirth;
//   String? gender;
//   String? image;
//   dynamic longitude;
//   dynamic latitude;
//   dynamic socialId;
//   dynamic socialType;
//   String? deviceToken;
//   int? isLoggedIn;
//   int? isBanned;
//   String? createdAt;
//   String? updatedAt;
//   String? imagePath;

//   Info({this.id, this.name, this.email, this.emailVerifiedAt, this.userType, this.phone, this.dateOfBirth, this.gender, this.image, this.longitude, this.latitude, this.socialId, this.socialType, this.deviceToken, this.isLoggedIn, this.isBanned, this.createdAt, this.updatedAt, this.imagePath});

//   Info.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     name = json["name"];
//     email = json["email"];
//     emailVerifiedAt = json["email_verified_at"];
//     userType = json["user_type"];
//     phone = json["phone"];
//     dateOfBirth = json["date_of_birth"];
//     gender = json["gender"];
//     image = json["image"];
//     longitude = json["longitude"];
//     latitude = json["latitude"];
//     socialId = json["social_id"];
//     socialType = json["social_type"];
//     deviceToken = json["device_token"];
//     isLoggedIn = json["is_logged_in"];
//     isBanned = json["is_banned"];
//     createdAt = json["created_at"];
//     updatedAt = json["updated_at"];
//     imagePath = json["image_path"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["id"] = id;
//     _data["name"] = name;
//      print("nameeeeee : $name");
//     _data["email"] = email;
//     _data["email_verified_at"] = emailVerifiedAt;
//     _data["user_type"] = userType;
//     _data["phone"] = phone;
//     _data["date_of_birth"] = dateOfBirth;
//     _data["gender"] = gender;
//     _data["image"] = image;
//     _data["longitude"] = longitude;
//     _data["latitude"] = latitude;
//     _data["social_id"] = socialId;
//     _data["social_type"] = socialType;
//     _data["device_token"] = deviceToken;
//     _data["is_logged_in"] = isLoggedIn;
//     _data["is_banned"] = isBanned;
//     _data["created_at"] = createdAt;
//     _data["updated_at"] = updatedAt;
//     _data["image_path"] = imagePath;
//     return _data;
//   }
// }

