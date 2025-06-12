import 'dart:io';

import 'package:abg/data/const/extensions.dart';
import 'package:abg/res/notification/push_notification.dart';

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

  }

  Future<Map<String, dynamic>> toJson() async {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
        data['image'] = image;

    data['date_of_birth'] = dateOfBirth?.stringDate;
    data['device_token'] =
        await PushNotificationsManager().getNotificationToken();
    return data;
  }
}
