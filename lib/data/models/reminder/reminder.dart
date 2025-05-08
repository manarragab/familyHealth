/// id : 3
/// user_id : 2
/// type : "medicine"
/// title : "medicine title is here"
/// description : "medicine description is here"
/// alarm_date : null
/// alarm_time : null
/// is_repeatable : 1
/// medicine_start_date : "2025-01-20"
/// medicine_end_date : "2025-01-23"
/// image : "uploads/alarms/5e0bdc07d57a49904b3b817aa498fe91.jpg"
/// is_triggered : 0
/// created_at : "2025-01-18T16:53:41.000000Z"
/// updated_at : "2025-01-18T16:53:41.000000Z"

class Reminders {
  Reminders({
    this.id,
    this.userId,
    this.type,
    this.title,
    this.description,
    this.alarmDate,
    this.alarmTime,
    this.isRepeatable,
    this.medicineStartDate,
    this.medicineEndDate,
    this.image,
    this.isTriggered,
    this.createdAt,
    this.updatedAt,
  });

  Reminders.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    alarmDate = json['alarm_date'];
    alarmTime = json['alarm_time'];
    isRepeatable = json['is_repeatable'];
    medicineStartDate = json['medicine_start_date'];
    medicineEndDate = json['medicine_end_date'];
    image = json['image'];
    isTriggered = json['is_triggered'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? userId;
  String? type;
  String? title;
  String? description;
  String? alarmDate;
  dynamic alarmTime;
  num? isRepeatable;
  String? medicineStartDate;
  String? medicineEndDate;
  String? image;
  num? isTriggered;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['type'] = type;
    map['title'] = title;
    map['description'] = description;
    map['alarm_date'] = alarmDate;
    map['alarm_time'] = alarmTime;
    map['is_repeatable'] = isRepeatable;
    map['medicine_start_date'] = medicineStartDate;
    map['medicine_end_date'] = medicineEndDate;
    map['image'] = image;
    map['is_triggered'] = isTriggered;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
