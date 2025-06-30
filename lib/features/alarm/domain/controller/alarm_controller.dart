import 'dart:io';

import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/models/alarm/post_alarms/post_alarm.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/alarm/domain/cases/alarm_cases.dart';
import 'package:abg/features/alarm/presentation/add_alarm.dart';
import 'package:abg/res/notification/alarm/alarm.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AlarmController extends MainGetxController with CustomStateMixin {
  AlarmType? selectRadio;

  AlarmModel model = AlarmModel();
  PostAlarm postAlarm = PostAlarm();

  RefreshController refreshController = RefreshController();
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController alarmDateController = TextEditingController();
  TextEditingController alarmTimeController = TextEditingController();
  TextEditingController medicineStartController = TextEditingController();
  TextEditingController medicineEndController = TextEditingController();
  String? imageUrl;

  int _page = 1;

  void clearData() {
    postAlarm = PostAlarm();
    for (TextEditingController controller in [
      nameController,
      messageController,
      alarmDateController,
      alarmTimeController,
      medicineStartController,
      medicineEndController,
    ]) {
      controller.clear();
    }
    selectRadio = null;
  }

  getDetails(int id) async {
    loadingGetxController.showCustomLoading(id.toString());
    var response = await sl<AlarmCases>().alarmDetails(id);
    loadingGetxController.hideCustomLoading(id.toString());
    statusError.checkStatus(response, () {
      updateAlarmData(response.data!);
    });
  }

  updateAlarmData(AlarmData alarm) {
    postAlarm = PostAlarm.fromJson(alarm.toJson());
    nameController.text = alarm.title ?? "";
    messageController.text = alarm.description ?? "";
    alarmDateController.text = alarm.alarmDate;
    // alarmTimeController.text = alarm.alarmTime  ;
    //alarmTimeController.text = DateFormat.jm().format(alarm.alarmTime);
    try {
      final parsedTime = DateFormat("HH:mm").parse(alarm.alarmTime);
      alarmTimeController.text = DateFormat.jm().format(parsedTime);
    } catch (e) {
      print("Error parsing alarm time: $e");
      alarmTimeController.text = alarm.alarmTime;
    }
    medicineStartController.text = alarm.medicineStartDate ?? "";
    medicineEndController.text = alarm.medicineEndDate ?? "";
    sPrint.info("type:: ${alarm.type}");
    selectRadio = AlarmType.values.asNameMap()[alarm.type];
    imageUrl = alarm.image;
    Get.to(() => const AddAlarm(), transition: Transition.fadeIn);
  }

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
      getPage: (page) => _page = page,
    );
  //  CustomAlarm().clearAll();
  //  model.data?.forEach((e) {
  //    CustomAlarm().addAlarm(e);
  //  });
  }


  addAlarm() async {
    loadingGetxController.showLoading();
    var response = await sl<AlarmCases>().addAlarm(postAlarm);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      // PushNotificationsManager().subscribe("alarm-${response.data?.alarmDate}_${response.data?.alarmTime}");
      CustomAlarm().addAlarm(response.data!);
      onRefresh();
      Get.back();
    });
  }

  deleteAlarm(int id) async {
    loadingGetxController.showCustomLoading(id.toString());
    var response = await sl<AlarmCases>().deleteAlarm(id);
    loadingGetxController.hideCustomLoading(id.toString());
    statusError.checkStatus(response, () {
      CustomAlarm().deleteAlarm(model.data!.firstWhere((e) => e.id == id));
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

  void updateAlarm() async {
    loadingGetxController.showLoading();
    var response = await sl<AlarmCases>().updateAlarm(postAlarm);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () async {
      onRefresh();
      postAlarm.image = null;
      CustomAlarm().addAlarm(AlarmData.fromJson(await postAlarm.toJson()));
      Get.back();
    });
  }
}
