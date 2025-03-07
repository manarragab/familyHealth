
class PostfamilyModel {
    PostFamily? data;
    int? status;
    String? message;

    PostfamilyModel({this.data, this.status, this.message});

    PostfamilyModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : PostFamily.fromJson(json["data"]);
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

class PostFamily {
    String? image;
    String? name;
    String? brithDate;
    String? phone;
    String? relative;
    int? userId;
    String? updatedAt;
    String? createdAt;
    int? id;

    PostFamily({this.image, this.name, this.brithDate, this.phone, this.relative, this.userId, this.updatedAt, this.createdAt, this.id});

    PostFamily.fromJson(Map<String, dynamic> json) {
        image = json["image"];
        name = json["name"];
        brithDate = json["brith_date"];
        phone = json["phone"];
        relative = json["relative"];
        userId = json["user_id"];
        updatedAt = json["updated_at"];
        createdAt = json["created_at"];
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["image"] = image;
        _data["name"] = name;
        _data["brith_date"] = brithDate;
        _data["phone"] = phone;
        _data["relative"] = relative;
        _data["user_id"] = userId;
        _data["updated_at"] = updatedAt;
        _data["created_at"] = createdAt;
        _data["id"] = id;
        return _data;
    }
}