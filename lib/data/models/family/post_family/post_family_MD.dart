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
        final Map<String, dynamic> Data = <String, dynamic>{}; 
        if (data != null) { 
            Data["data"] = data!.toJson(); 
        }
        Data["status"] = status;
        Data["message"] = message;
        return Data;
    }
}

class PostFamily {
    String? image;
    String? name;
    String? birthDate; 
    String? phone;
    String? relative;
    int? userId;
    String? updatedAt;
    String? createdAt;
    int? id;

    PostFamily({this.image, this.name, this.birthDate, this.phone, this.relative, this.userId, this.updatedAt, this.createdAt, this.id});

    PostFamily.fromJson(Map<String, dynamic> json) {
        image = json["image"];
        name = json["name"];
        birthDate = json["brith_date"];
        phone = json["phone"];
        relative = json["relative"];
        userId = json["user_id"];
        updatedAt = json["updated_at"];
        createdAt = json["created_at"];
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> Data = <String, dynamic>{}; // ✅ Renamed to Data
        Data["image"] = image;
        Data["name"] = name;
        Data["brith_date"] = birthDate;
        Data["phone"] = phone;
        Data["relative"] = relative;
        Data["user_id"] = userId;
        Data["updated_at"] = updatedAt;
        Data["created_at"] = createdAt;
        Data["id"] = id;
        return Data;
    }
}