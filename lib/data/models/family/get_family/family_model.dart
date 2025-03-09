
import 'package:abg/data/remote_data/response_model.dart';

class FamilyModel extends ResponseModel<List<Family>?>{
    @override
  List<Family>? data;
    @override
  num? status;
    @override
  String? message;

    FamilyModel({this.data, this.status, this.message});

    FamilyModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Family.fromJson(e)).toList();
        status = json["status"];
        message = json["message"];
    }

    @override
  Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if(data != null) {
            data["data"] = data?.map((e) => e.toJson()).toList();
        }
        data["status"] = status;
        data["message"] = message;
        return data;
    }
}

class Family {
    int? id;
    String? name;
    String? image;
    String? relative;
    int? age;

    Family({this.id, this.name, this.image, this.relative, this.age});

    Family.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        image = json["image"];
        relative = json["relative"];
        age = json["age"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["id"] = id;
        data["name"] = name;
        data["image"] = image;
        data["relative"] = relative;
        data["age"] = age;
        return data;
    }
}