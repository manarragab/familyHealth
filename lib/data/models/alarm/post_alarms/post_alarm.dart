import 'dart:io';

/// image : "file"
/// type : "medicine"
/// title : "medicine title is here"
/// description : "medicine description is here"
/// medicine_start_date : "2025-01-20"
/// medicine_end_date : "2025-01-23"
/// is_repeatable : "1"

class PostAlarm {
  PostAlarm({
    this.image,
    this.type,
    this.title,
    this.description,
    this.medicineStartDate,
    this.medicineEndDate,
    this.isRepeatable,
  });

  PostAlarm.fromJson(dynamic json) {
    type = json['type'];
    title = json['title'];
    description = json['description'];
    medicineStartDate = json['medicine_start_date'];
    medicineEndDate = json['medicine_end_date'];
    isRepeatable = json['is_repeatable'];
  }
  File? image;
  String? type;
  String? title;
  String? description;
  String? medicineStartDate;
  String? medicineEndDate;
  String? isRepeatable;

  Future<Map<String, dynamic>> toJson() async {
    final map = <String, dynamic>{};
    if (image != null) {
      map['image'] = image;
    }
    map['type'] = type;
    map['title'] = title;
    map['description'] = description;
    map['medicine_start_date'] = medicineStartDate;
    map['medicine_end_date'] = medicineEndDate;
    map['is_repeatable'] = isRepeatable;
    return map;
  }
}
