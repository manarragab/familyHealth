import 'dart:io';

/// first_name : "Saw"

// class PostEditProfile {
//   PostEditProfile({
//     this.firstName,
//     this.lastName,
//   });

//   PostEditProfile.fromJson(dynamic json) {
//     firstName = json['first_name'];
//     lastName = json['lastName'];
//   }

//   String? firstName, lastName;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['first_name'] = firstName;
//     map['last_name'] = lastName;
//     return map;
//   }
// }


import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class PostEditProfile {
  String? name;
  String? email;
  String? phone;
  DateTime? dateOfBirth;
  String? password;
  String? gender;
  File? image;

  PostEditProfile({this.name, this.email, this.phone, this.dateOfBirth, this.password, this.gender, this.image});

  PostEditProfile.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    dateOfBirth = json["date_of_birth"];
    password = json["password"];
    gender = json["gender"];
    image = json["image"];
  }

  Future<Map<String, dynamic>> toJson() async{
    final Map<String, dynamic> data = <String, dynamic>{};

     if (image != null) {
      final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream'; // Detect file type
      final mediaType = MediaType.parse(mimeType); // Convert to MediaType
      data['image'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
    }
    data["name"] = name;
    data["email"] = email;
    data["phone"] = phone;
    data["date_of_birth"] = dateOfBirth;
    data["password"] = password;
    data["gender"] = gender;
    data["image"] = image;
    return data;
  }
}
