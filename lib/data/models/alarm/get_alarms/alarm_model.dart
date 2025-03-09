import 'package:abg/data/remote_data/response_model.dart';

/// data : [{"id":3,"user_id":2,"type":"medicine","title":"medicine title is here","description":"medicine description is here","alarm_date":null,"alarm_time":null,"is_repeatable":1,"medicine_start_date":"2025-01-20","medicine_end_date":"2025-01-23","image":"uploads/alarms/5e0bdc07d57a49904b3b817aa498fe91.jpg","is_triggered":0,"created_at":"2025-01-18T18:53:41.000000Z","updated_at":"2025-01-18T18:53:41.000000Z"},{"id":2,"user_id":2,"type":"appointment","title":"appointment title is here","description":"appointment description is here","alarm_date":"2025-02-22","alarm_time":"03:00:00","is_repeatable":0,"medicine_start_date":null,"medicine_end_date":null,"image":"uploads/alarms/220923e1738ba3fb642ccbc5fdf4d3c1.jpg","is_triggered":0,"created_at":"2025-01-18T18:52:07.000000Z","updated_at":"2025-01-18T18:52:07.000000Z"},{"id":1,"user_id":2,"type":"reminder","title":"reminder title is here","description":"reminder description is here","alarm_date":"2025-01-20","alarm_time":"22:00:00","is_repeatable":0,"medicine_start_date":null,"medicine_end_date":null,"image":"uploads/alarms/1c4b11bd03014e0a85390b99a5320074.jpg","is_triggered":0,"created_at":"2025-01-18T18:51:19.000000Z","updated_at":"2025-01-18T18:51:19.000000Z"}]
/// status : 200
/// message : "Success"

class AlarmModel extends ResponseModel<List<Alarm>?> {
  AlarmModel({
    this.data,
    this.status,
    this.message,
  });

  AlarmModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Alarm.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
  @override
  List<Alarm>? data;
  @override
  num? status;
  @override
  String? message;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}

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
/// created_at : "2025-01-18T18:53:41.000000Z"
/// updated_at : "2025-01-18T18:53:41.000000Z"

class Alarm {
  Alarm({
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

  Alarm.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    alarmDate = json['alarm_date'];
    alarmTime = json['alarm_time'];
    isRepeatable = json['is_repeatable']?.toString();
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
  dynamic alarmDate;
  dynamic alarmTime;
  String? isRepeatable;
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
