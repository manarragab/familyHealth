import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

/// id : 4
/// user_id : 2
/// name : "Family member two name"
/// brith_date : "1980-02-22 00:00:00"
/// phone : "01152067272"
/// relative : "Brother"
/// image : "uploads/family/46577acb47d3a7d5b1c9c1d040ab3309.jpg"
/// created_at : "2025-01-19T18:33:16.000000Z"
/// updated_at : "2025-01-19T18:33:16.000000Z"

class FamilyReminders {
  FamilyReminders({
    this.id,
    this.userId,
    this.name,
    this.brithDate,
    this.phone,
    this.relative,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.medicalRecord,
  });

  FamilyReminders.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    brithDate = json['brith_date'];
    phone = json['phone'];
    relative = json['relative'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    medicalRecord = json['medical_record[]'];
  }
  num? id;
  num? userId;
  String? name;
  String? brithDate;
  String? phone;
  String? relative;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? medicalRecord;

  Future<Map<String, dynamic>> toJson() async {
    final map = <String, dynamic>{};
    //  if (image != null) {
    //   final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream';
    //   final mediaType = MediaType.parse(mimeType);
    //   map['image'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
    // }
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['brith_date'] = brithDate;
    map['phone'] = phone;
    map['relative'] = relative;
    map['image'] = image;
    print("image: $image");
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['medical_record[]'] = medicalRecord;

    return map;
  }
}
