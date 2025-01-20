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
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['password'] = password;
    _data['device_token'] =
        await PushNotificationsManager().getNotificationToken();
    return _data;
  }
}
