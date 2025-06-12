import 'dart:math';

import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/alarm/domain/controller/alarm_controller.dart';
import 'package:abg/features/alarm/presentation/add_alarm.dart';
import 'package:abg/features/alarm/presentation/widget/alarm_item.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AlarmScreen extends GetView<AlarmController> {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.myAlarm.tr),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        child: ListView(
          children: [
            Center(
              child: MainButton(
                onPressed: () {
                  controller.clearData();
                 Get.to(const AddAlarm());
            /*      CustomAlarm().addAlarm(AlarmData(
                    id: Random(4).nextInt(100),
                    userId: Random(4).nextInt(100),
                    type: "medicine",
                    title: "Take Morning Medicine",
                    description: "Take your blood pressure medicine.",
                    alarmDate: "2025-03-15",
                    alarmTime: "${DateTime.now().hour}:${DateTime.now().add(const Duration(minutes: 20)).minute}",
                    isRepeatable: "1",
                    medicineStartDate: DateTime.now().toString(),
                    medicineEndDate: "2025-03-20",
                    image: "uploads/alarms/example.jpg",
                    isTriggered: 0,
                  ));*/
                },
                radius: 10,
                title: CustomTrans.newAlarm.tr,
                fontSize: 24,
              ),
            ),
            controller.obx((state) {
              AlarmModel model = state;
              List<AlarmData> list = model.data ?? [];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(list.length, (index) {
                    AlarmData alarm = list[index];
      final  alarmTime = DateFormat.jm().format(DateFormat("HH:mm").parse(alarm.alarmTime));         
                    return LoadingOverLay(
                      showLoadingOnly: true,
                      id: alarm.id.toString(),
                      child: AlarmItem(
                        image: alarm.image??"",
                        title: alarm.title ?? "",
                        description: alarm.description ?? "",
                        date: alarm.alarmDate ?? "",
                        time: alarmTime ?? "",
                        onEdit: () {
                          controller.getDetails(alarm.id!.toInt());
                        },
                        onDelete: () {
                          controller.deleteAlarm(alarm.id!.toInt());
                        },
                      ),
                    );
                  })
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
