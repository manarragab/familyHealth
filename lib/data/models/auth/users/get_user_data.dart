
import 'package:abg/data/remote_data/response_model.dart';

class GetUserData extends ResponseModel<User>  {
  @override
  User? data;
  @override
  num? status;
  @override
  String? message;

  GetUserData({this.data, this.status, this.message});

  GetUserData.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : User.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(data != null) {
      data["data"] = data?.toJson();
    }
    data["status"] = status;
    data["message"] = message;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    print("name::: $name");
    data["email"] = email;
    data["email_verified_at"] = emailVerifiedAt;
    data["user_type"] = userType;
    data["phone"] = phone;
    data["date_of_birth"] = dateOfBirth;
    data["gender"] = gender;
    data["image"] = image;
    data["longitude"] = longitude;
    data["latitude"] = latitude;
    data["social_id"] = socialId;
    data["social_type"] = socialType;
    data["device_token"] = deviceToken;
    data["is_logged_in"] = isLoggedIn;
    data["is_banned"] = isBanned;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["image_path"] = imagePath;
    return data;
  }
}