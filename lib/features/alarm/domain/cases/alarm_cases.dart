import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/models/alarm/post_alarms/post_alarm.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';

class AlarmCases {
  final DomainData _data;

  AlarmCases(this._data);

  Future<ResponseModel<List<Alarm>?>> getAlarm() {
    return _data.getAlarm();
  }

  Future<ResponseModel<Alarm?>> addAlarm(PostAlarm post) {
    return _data.addAlarm(post);
  }

  Future<ResponseModel<dynamic>> deleteAlarm(int id) {
    return _data.deleteAlarm(id);
  }
}
