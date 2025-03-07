
import 'package:abg/data/remote_data/response_model.dart';

class FamilyModel extends ResponseModel<List<Family>?>{
    List<Family>? data;
    num? status;
    String? message;

    FamilyModel({this.data, this.status, this.message});

    FamilyModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Family.fromJson(e)).toList();
        status = json["status"];
        message = json["message"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        _data["status"] = status;
        _data["message"] = message;
        return _data;
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
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["image"] = image;
        _data["relative"] = relative;
        _data["age"] = age;
        return _data;
    }
}