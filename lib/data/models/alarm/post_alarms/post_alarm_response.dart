import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/remote_data/response_model.dart';

/// data : {"type":"reminder","title":"reminder title is here","description":"reminder description is here","alarm_date":"2025-01-20","alarm_time":"22:00","is_repeatable":"0","image":"uploads/alarms/1c4b11bd03014e0a85390b99a5320074.jpg","user_id":2,"updated_at":"2025-01-18T18:51:19.000000Z","created_at":"2025-01-18T18:51:19.000000Z","id":1}
/// status : 201
/// message : "Alarm Created Successfully!"

class PostAlarmResponse extends ResponseModel<Alarm?> {
    @override
  Alarm? data;
  @override
  num? status;
  @override
  String? message;

  PostAlarmResponse({
    this.data,
    this.status,
    this.message,
  });

  PostAlarmResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Alarm.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  @override
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
