
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
        final Map<String, dynamic> data = <String, dynamic>{};
        if(data != null) {
            data["data"] = data?.toJson();
        }
        data["status"] = status;
        data["message"] = message;
        return data;
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
        final Map<String, dynamic> data = <String, dynamic>{};
        data["image"] = image;
        data["name"] = name;
        data["brith_date"] = brithDate;
        data["phone"] = phone;
        data["relative"] = relative;
        data["user_id"] = userId;
        data["updated_at"] = updatedAt;
        data["created_at"] = createdAt;
        data["id"] = id;
        return data;
    }
}