import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class PostFamilyModel {
  File? image;
  String? name;
  String? brithDate;
  String? phone;
  String? relative;
   String? medicalRecord;

  PostFamilyModel({
    this.image,
    this.name,
    this.brithDate,
    this.phone,
    this.relative,
    this.medicalRecord,
  });

  factory PostFamilyModel.fromJson(Map<String, dynamic> json) {
    return PostFamilyModel(
    image: json['image'],
      name: json['name'],
      brithDate: json['brith_date'],
      phone: json['phone'],
      relative: json['relative'],
      medicalRecord: json['medical_record[]'],
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    final map = <String, dynamic>{};
     if (image != null) {
      final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream'; 
      final mediaType = MediaType.parse(mimeType); 
      map['image'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
    }
    map['name'] = name;
    map['brith_date'] = brithDate;
    map['phone'] = phone;
    map['relative'] = relative;
    map['medical_record[]'] = medicalRecord;
    print("medical_record[]: $medicalRecord");
    return map;
  }
}



// class PostFamilyModel {
//   File? image; // This holds the image URL or asset path
//   String? name;
//   String? brithDate;
//   String? phone;
//   String? relative;
//   String? medicalRecord;

//   PostFamilyModel({
//     this.image,
//     this.name,
//     this.brithDate,
//     this.phone,
//     this.relative,
//     this.medicalRecord,
//   });

//   PostFamilyModel.fromJson(Map<String, dynamic> json) {
//     image = json["image"]; // ✅ now it's fine
//     name = json["name"];
//     brithDate = json["brith_date"];
//     phone = json["phone"];
//     relative = json["relative"];
//     medicalRecord = json["medical_record[]"];
//   }

//   // Use File for uploading in toJson
//   File? fileImage; // for upload only

//   Future<Map<String, dynamic>> toJson() async {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     if (fileImage != null) {
//       final mimeType = lookupMimeType(fileImage!.path) ?? 'application/octet-stream';
//       final mediaType = MediaType.parse(mimeType);
//       _data['image'] = await MultipartFile.fromFile(fileImage!.path, contentType: mediaType);
//     }
//     _data["name"] = name;
//     _data["brith_date"] = brithDate;
//     _data["phone"] = phone;
//     _data["relative"] = relative;
//     _data["medical_record[]"] = medicalRecord;
//     print("medical_record[]: $medicalRecord");
//     return _data;
//   }
// }
