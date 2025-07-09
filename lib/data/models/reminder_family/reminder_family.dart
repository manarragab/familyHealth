

/// id : 4
/// user_id : 2
/// name : "Family member two name"
/// brith_date : "1980-02-22 00:00:00"
/// phone : "01152067272"
/// relative : "Brother"
/// image : "uploads/family/46577acb47d3a7d5b1c9c1d040ab3309.jpg"
/// created_at : "2025-01-19T18:33:16.000000Z"
/// updated_at : "2025-01-19T18:33:16.000000Z"

// class FamilyReminders {
//   FamilyReminders({
//     this.id,
//     this.userId,
//     this.name,
//     this.brithDate,
//     this.phone,
//     this.relative,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//     this.medicalRecord,
//   });

//   FamilyReminders.fromJson(dynamic json) {
//     id = json['id'];
//     userId = json['user_id'];
//     name = json['name'];
//     brithDate = json['brith_date'];
//     phone = json['phone'];
//     relative = json['relative'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     medicalRecord = json['medical_record[]'];
//   }
//   num? id;
//   num? userId;
//   String? name;
//   String? brithDate;
//   String? phone;
//   String? relative;
//   String? image;
//   String? createdAt;
//   String? updatedAt;
//   String? medicalRecord;

//   Future<Map<String, dynamic>> toJson() async {
//     final map = <String, dynamic>{};
//     //  if (image != null) {
//     //   final mimeType = lookupMimeType(image!.path) ?? 'application/octet-stream';
//     //   final mediaType = MediaType.parse(mimeType);
//     //   map['image'] = await MultipartFile.fromFile(image!.path,contentType: mediaType);
//     // }
//     map['id'] = id;
//     map['user_id'] = userId;
//     map['name'] = name;
//     map['brith_date'] = brithDate;
//     map['phone'] = phone;
//     map['relative'] = relative;
//     map['image'] = image;
//     print("image: $image");
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     map['medical_record[]'] = medicalRecord;

//     return map;
//   }
// }





class FamilyReminders {
  List<FamilyReminders1>? familyReminders;

  FamilyReminders({this.familyReminders});

  FamilyReminders.fromJson(Map<String, dynamic> json) {
    familyReminders = json["family_reminders"] == null ? null : (json["family_reminders"] as List).map((e) => FamilyReminders1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(familyReminders != null) {
      data["family_reminders"] = familyReminders?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class FamilyReminders1 {
  int? id;
  int? userId;
  String? name;
  String? brithDate;
  String? phone;
  String? relative;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<FamilyRecords>? familyRecords;

  FamilyReminders1({this.id, this.userId, this.name, this.brithDate, this.phone, this.relative, this.image, this.createdAt, this.updatedAt, this.familyRecords});

  FamilyReminders1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    name = json["name"];
    brithDate = json["brith_date"];
    phone = json["phone"];
    relative = json["relative"];
    image = json["image"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    familyRecords = json["family_records"] == null ? null : (json["family_records"] as List).map((e) => FamilyRecords.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;


































































    data["user_id"] = userId;
    data["name"] = name;
    data["brith_date"] = brithDate;
    data["phone"] = phone;
    data["relative"] = relative;
    data["image"] = image;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    if(familyRecords != null) {
      data["family_records"] = familyRecords?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class FamilyRecords {
  int? id;
  int? familyId;
  String? type;
  String? createdAt;
  String? updatedAt;

  FamilyRecords({this.id, this.familyId, this.type, this.createdAt, this.updatedAt});

  FamilyRecords.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    familyId = json["family_id"];
    type = json["type"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["family_id"] = familyId;
    data["type"] = type;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}