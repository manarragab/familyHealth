import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

// class PostFamilyModel {
//   File? image;
//   String? name;
//   String? brithDate;
//   String? phone;
//   String? relative;
//    String? medicalRecord;

//   PostFamilyModel({
//     this.image,
//     this.name,
//     this.brithDate,
//     this.phone,
//     this.relative,
//     this.medicalRecord,
//   });

//   factory PostFamilyModel.fromJson(Map<String, dynamic> json) {
//     return PostFamilyModel(
//     image: json['image'],
//       name: json['name'],
//       brithDate: json['brith_date'],
//       phone: json['phone'],
//       relative: json['relative'],
//       medicalRecord: json['medical_record[]'],
//     );
//   }

//   Future<Map<String, dynamic>> toJson() async {
//     final map = <String, dynamic>{};
//      if (image != null) {
//       final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream'; 
//       final mediaType = MediaType.parse(mimeType); 
//       map['image'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
//     }
//     map['name'] = name;
//     map['brith_date'] = brithDate;
//     map['phone'] = phone;
//     map['relative'] = relative;
//     map['medical_record[]'] = medicalRecord;
//     print("medical_record[]: $medicalRecord");
//     return map;
//   }
// }


class PostFamilyModel {
  File? image;
  String? name;
  String? brithDate;
  String? phone;
  String? relative;
  List<String> medicalRecord; // ✅ use List

  PostFamilyModel({
    this.image,
    this.name,
    this.brithDate,
    this.phone,
    this.relative,
    this.medicalRecord = const [], // default empty list
  });

  factory PostFamilyModel.fromJson(Map<String, dynamic> json) {
    return PostFamilyModel(
      name: json['name'],
      brithDate: json['brith_date'],
      phone: json['phone'],
      relative: json['relative'],
      medicalRecord: List<String>.from(json['medical_record[]'] ?? []),
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    final map = <String, dynamic>{};

    if (image != null) {
      final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream';
      final mediaType = MediaType.parse(mimeType);
      map['image'] = await MultipartFile.fromFile(
        image!.path,
        contentType: mediaType,
      );
    }

    map['name'] = name;
    map['brith_date'] = brithDate;
    map['phone'] = phone;
    map['relative'] = relative;

    // ✅ Send each item as repeated "medical_record[]"
    for (var record in medicalRecord) {
      map.putIfAbsent('medical_record[]', () => []).add(record);
    }

    print("medical_record[]: $medicalRecord");
    return map;
  }
}
