import 'dart:io';

import 'package:abg/data/const/extensions.dart';
import 'package:abg/res/notification/push_notification.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart'; 


class PostRegister {
  PostRegister({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.image,
  });

  String? name;
  String? email;
  String? phone;
  String? gender;
  String? password;
File? image;
  DateTime? dateOfBirth;

  PostRegister.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    dateOfBirth = json['date_of_birth'];
        image = json['image'];
        
                gender = json['gender'];


  }

  Future<Map<String, dynamic>> toJson() async {
    final data = <String, dynamic>{};
     if (image != null) {
      final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream'; // Detect file type
      final mediaType = MediaType.parse(mimeType); // Convert to MediaType
      data['image'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
    }
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
      
               data['gender']= gender ;
print("gender:: $gender");  
    data['date_of_birth'] = dateOfBirth?.stringDate;
    data['device_token'] =
        await PushNotificationsManager().getNotificationToken();
    return data;
  }
}
