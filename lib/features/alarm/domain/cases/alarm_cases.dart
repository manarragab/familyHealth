import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/models/chat/group/post_group_message.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';

class AlarmCases {
  DomainData _data;

  AlarmCases(this._data);

  Future<ResponseModel<List<Alarm>?>> getAlarm(PostGroupMessage post) {
    return _data.getAlarm(post);
  }

  Future<ResponseModel<Alarm?>> addAlarm(PostGroupMessage post) {
    return _data.addAlarm(post);
  }

  Future<ResponseModel<dynamic>> deleteAlarm(int id) {
    return _data.deleteAlarm(id);
  }
}
