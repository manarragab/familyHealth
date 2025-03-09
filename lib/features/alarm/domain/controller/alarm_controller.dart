import 'dart:io';

import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/models/alarm/post_alarms/post_alarm.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/alarm/domain/cases/alarm_cases.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AlarmController extends MainGetxController with CustomStateMixin {
  AlarmType? selectRadio;

  AlarmModel model = AlarmModel();
  PostAlarm postAlarm = PostAlarm();

  RefreshController refreshController = RefreshController();
  TextEditingController alarmDateController = TextEditingController();
  TextEditingController alarmTimeController = TextEditingController();
  TextEditingController medicineStartController = TextEditingController();
  TextEditingController medicineEndController = TextEditingController();
  int _page = 1;

  onRefresh() async {
    model = await refreshData(
      model: model,
      futureMethod: () => sl<AlarmCases>().getAlarm(),
      controller: refreshController,
      checkIfEmpty: (data) {
        if (data is AlarmModel) {
          if (data.data?.isEmpty ?? true) {
            data.status = StatusType.empty.index;
          }
        }
        return data;
      },
      getPage: (_) => _,
    );
  }

  addAlarm() async {
    loadingGetxController.showLoading();
    var response = await sl<AlarmCases>().addAlarm(postAlarm);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      onRefresh();
      Get.back();
    });
  }

  deleteAlarm(int id) async {
    loadingGetxController.showCustomLoading(id.toString());
    var response = await sl<AlarmCases>().deleteAlarm(id);
    loadingGetxController.hideCustomLoading(id.toString());
    statusError.checkStatus(response, () {
      model.data?.removeWhere((e) => e.id == id);
      change(model);
    });
  }

  void selectradio(AlarmType value) {
    selectRadio = value;
    update();
  }

  var image = Rx<File?>(null);
  var isLoading = false.obs;
}
