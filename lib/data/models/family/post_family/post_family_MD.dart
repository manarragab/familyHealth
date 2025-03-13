import 'dart:io';


import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class PostFamilyModel {
  File? image;
  String? name;
  String? birthDate;
  String? phone;
  String? relative;
  int? userId;
  int? id;

  PostFamilyModel({
    this.image,
    this.name,
    this.birthDate,
    this.phone,
    this.relative,
    this.userId,
    this.id,
  });

  factory PostFamilyModel.fromJson(Map<String, dynamic> json) {
    return PostFamilyModel(
    //  image: json['image'],
      name: json['name'],
      birthDate: json['brith_date'],
      phone: json['phone'],
      relative: json['relative'],
      userId: json['user_id'],
      id: json['id'],
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    final map = <String, dynamic>{};
    // if (image != null) {
    //   final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream'; // Detect file type
    //   final mediaType = MediaType.parse(mimeType); // Convert to MediaType
    //   map['image'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
    // }
    map['name'] = name;
    map['brith_date'] = birthDate;
    map['phone'] = phone;
    map['relative'] = relative;
    map['medical_record[0]'] = "hhhnnnm";
    map['userId'] = userId;
    map['id'] = id ;
    return map;
  }
}
