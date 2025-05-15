import 'package:abg/data/const/extensions.dart';
import 'package:abg/res/notification/push_notification.dart';

class PostRegister {
  PostRegister({
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  String? name;
  String? email;
  String? phone;
  String? password;

  DateTime? dateOfBirth;

  PostRegister.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    dateOfBirth = json['date_of_birth'];
  }

  Future<Map<String, dynamic>> toJson() async {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['date_of_birth'] = dateOfBirth?.stringDate;
    data['device_token'] =
        await PushNotificationsManager().getNotificationToken();
    return data;
  }
}
