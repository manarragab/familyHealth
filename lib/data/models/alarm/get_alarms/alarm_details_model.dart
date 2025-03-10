import 'package:abg/data/remote_data/response_model.dart';

import 'alarm_model.dart';

/// data : [{"id":3,"user_id":2,"type":"medicine","title":"medicine title is here","description":"medicine description is here","alarm_date":null,"alarm_time":null,"is_repeatable":1,"medicine_start_date":"2025-01-20","medicine_end_date":"2025-01-23","image":"uploads/alarms/5e0bdc07d57a49904b3b817aa498fe91.jpg","is_triggered":0,"created_at":"2025-01-18T18:53:41.000000Z","updated_at":"2025-01-18T18:53:41.000000Z"},{"id":2,"user_id":2,"type":"appointment","title":"appointment title is here","description":"appointment description is here","alarm_date":"2025-02-22","alarm_time":"03:00:00","is_repeatable":0,"medicine_start_date":null,"medicine_end_date":null,"image":"uploads/alarms/220923e1738ba3fb642ccbc5fdf4d3c1.jpg","is_triggered":0,"created_at":"2025-01-18T18:52:07.000000Z","updated_at":"2025-01-18T18:52:07.000000Z"},{"id":1,"user_id":2,"type":"reminder","title":"reminder title is here","description":"reminder description is here","alarm_date":"2025-01-20","alarm_time":"22:00:00","is_repeatable":0,"medicine_start_date":null,"medicine_end_date":null,"image":"uploads/alarms/1c4b11bd03014e0a85390b99a5320074.jpg","is_triggered":0,"created_at":"2025-01-18T18:51:19.000000Z","updated_at":"2025-01-18T18:51:19.000000Z"}]
/// status : 200
/// message : "Success"

class AlarmDetailsModel extends ResponseModel<Alarm?> {
  AlarmDetailsModel({
    this.data,
    this.status,
    this.message,
  });

  AlarmDetailsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
     data = Alarm.fromJson(json['data']);
    }
    status = json['status'];
    message = json['message'];
  }
  Alarm? data;
  num? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}

