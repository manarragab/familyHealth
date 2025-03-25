
import 'package:abg/data/remote_data/response_model.dart';


class PostFamilyResponse extends ResponseModel<Family?> {
    @override
  Family? data;
    @override
  num? status;
    @override
  String? message;

    PostFamilyResponse({this.data, this.status, this.message});

    PostFamilyResponse.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : Family.fromJson(json["data"]);
        status = json["status"];
        message = json["message"];
    }

    @override
 @override
Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    if (data != null) {
        result["data"] = data?.toJson();
    }
    result["status"] = status;
    result["message"] = message;
    return result;
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