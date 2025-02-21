import 'package:abg/res/notification/push_notification.dart';

class PostRegister {
  PostRegister({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  String? name;
  String? email;
  String? phone;
  String? password;

  PostRegister.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  Future<Map<String, dynamic>> toJson() async {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['device_token'] =
        await PushNotificationsManager().getNotificationToken();
    return data;
  }
}
