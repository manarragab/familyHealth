import 'package:abg/data/remote_data/response_model.dart';

class PostFamilyResponseModel extends ResponseModel<Family> {
  Family? data;
  num? status;
  String? message;

  PostFamilyResponseModel({this.data, this.status, this.message});

  PostFamilyResponseModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Family.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> Data = <String, dynamic>{};
    if (data != null) {
      Data["data"] = data!.toJson();
    }
    Data["status"] = status;
    Data["message"] = message;
    return Data;
  }
}

class Family {
  String? image;
  String? name;
  String? birthDate;
  String? phone;
  String? relative;
  int? userId;
  int? id;

  int? age;

  Family(
      {this.image,
      this.name,
      this.birthDate,
      this.phone,
      this.relative,
      this.userId,
      this.id});

  Family.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    name = json["name"];
    birthDate = json["brith_date"];
    phone = json["phone"];
    relative = json["relative"];
    userId = json["user_id"];
    id = json["id"];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{}; // ✅ Renamed to Data
    data["image"] = image;
    data["name"] = name;
    data["brith_date"] = birthDate;
    data["phone"] = phone;
    data["relative"] = relative;
    data["user_id"] = userId;
    data["id"] = id;
    data['age'] = age;
    return data;
  }
}
