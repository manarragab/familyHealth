import 'package:abg/data/remote_data/response_model.dart';

class LoginModel extends ResponseModel<LoginData?> {
  LoginModel({
    this.status,
    this.msg,
    this.data,
  });

  LoginModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    msg = json["message"];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    if (data != null && json['token'] != null) {
      data?.deviceToken = json['token'];
    }
  }

  @override
  num? status;
  String? msg;
  @override
  LoginData? data;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map["message"] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class LoginData {
  LoginData({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.userType,
    this.academicYear,
    this.phone,
    this.image,
    this.deviceToken,
    this.isLoggedIn,
    this.isBanned,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? userType;
  String? academicYear;
  String? phone;
  String? image;

  String? deviceToken;
  int? isLoggedIn;
  int? isBanned;
  String? createdAt;
  String? updatedAt;

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    userType = json['user_type'];
    academicYear = null;
    phone = json['phone'];
    image = json['image_path'];
    deviceToken = json['token'];
    isLoggedIn = json['is_logged_in'];
    isBanned = json['is_banned'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['user_type'] = userType;
    data['academic_year'] = academicYear;
    data['phone'] = phone;
    data['image_path'] = image;
    data['token'] = deviceToken;
    data['is_logged_in'] = isLoggedIn;
    data['is_banned'] = isBanned;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
