import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
/// image : "file"
/// type : "medicine"
/// title : "medicine title is here"
/// description : "medicine description is here"
/// medicine_start_date : "2025-01-20"
/// medicine_end_date : "2025-01-23"
/// is_repeatable : "1"

class PostAlarm {
  PostAlarm({
    this.image,
    this.type,
    this.title,
    this.description,
    this.medicineStartDate,
    this.medicineEndDate,
    this.isRepeatable = false,
  });

  PostAlarm.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    imageData = json['image'];
    alarmDate = json["alarm_date"];
    alarmTime = json['alarm_time'];
    description = json['description'];
    medicineStartDate = json['medicine_start_date'];
    medicineEndDate = json['medicine_end_date'];
    isRepeatable = json['is_repeatable'] == "1";
  }

  String? imageData;
  File? image;
  String? type;
  String? title;
  String? description;
  String? medicineStartDate;
  String? medicineEndDate;
  bool isRepeatable = false;

  String? alarmDate;

  String? alarmTime;

  int? id;

  Future<Map<String, dynamic>> toJson() async {
    final map = <String, dynamic>{};
    if (image != null) {
      final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream'; // Detect file type
      final mediaType = MediaType.parse(mimeType); // Convert to MediaType
      map['image'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
    }
    map['type'] = type;
    map['title'] = title;
    map['description'] = description;
    map['alarm_date'] = alarmDate;
    map['alarm_time'] = alarmTime;
    map['medicine_start_date'] = medicineStartDate ?? alarmDate;
    map['medicine_end_date'] = medicineEndDate;
    map['is_repeatable'] = isRepeatable ? "1" : "0";
    return map;
  }
}
