
import 'package:abg/data/remote_data/response_model.dart';

class GetUserData extends ResponseModel<User>  {
  User? data;
  num? status;
  String? message;

  GetUserData({this.data, this.status, this.message});

  GetUserData.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : User.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status"] = status;
    _data["message"] = message;
    return _data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? userType;
  String? phone;
  String? dateOfBirth;
  String? gender;
  String? image;
  dynamic longitude;
  dynamic latitude;
  dynamic socialId;
  dynamic socialType;
  String? deviceToken;
  int? isLoggedIn;
  int? isBanned;
  String? createdAt;
  String? updatedAt;
  String? imagePath;

  User({this.id, this.name, this.email, this.emailVerifiedAt, this.userType, this.phone, this.dateOfBirth, this.gender, this.image, this.longitude, this.latitude, this.socialId, this.socialType, this.deviceToken, this.isLoggedIn, this.isBanned, this.createdAt, this.updatedAt, this.imagePath});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    userType = json["user_type"];
    phone = json["phone"];
    dateOfBirth = json["date_of_birth"];
    gender = json["gender"];
    image = json["image"];
    longitude = json["longitude"];
    latitude = json["latitude"];
    socialId = json["social_id"];
    socialType = json["social_type"];
    deviceToken = json["device_token"];
    isLoggedIn = json["is_logged_in"];
    isBanned = json["is_banned"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    imagePath = json["image_path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    print("name::: $name");
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["user_type"] = userType;
    _data["phone"] = phone;
    _data["date_of_birth"] = dateOfBirth;
    _data["gender"] = gender;
    _data["image"] = image;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    _data["social_id"] = socialId;
    _data["social_type"] = socialType;
    _data["device_token"] = deviceToken;
    _data["is_logged_in"] = isLoggedIn;
    _data["is_banned"] = isBanned;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["image_path"] = imagePath;
    return _data;
  }
}