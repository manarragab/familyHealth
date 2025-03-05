import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/alarm/domain/controller/alarm_controller.dart';
import 'package:abg/features/alarm/presentation/add_alarm.dart';
import 'package:abg/features/alarm/presentation/widget/alarm_item.dart';

class AlarmScreen extends GetView<AlarmController> {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.myAlarm.tr),
      body: ListView(
        children: [
          Center(
            child: MainButton(
              onPressed: () {
                Get.to(const AddAlarm());
              },
              radius: 10,
              title: CustomTrans.newAlarm.tr,
              fontSize: 24,
            ),
          ),
          Container(
            height: Get.height,
            alignment: Alignment.center,
            child: controller.obx((state) {
              AlarmModel model = state;
              List<Alarm> list = model.data ?? [];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Text(
                        'Today',
                        style: GoogleFonts.almarai(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: CustomColors.lightBlue2),
                      )),*/
                  ...List.generate(list.length, (index) {
                    Alarm alarm = list[index];
                    return AlarmItem(
                      title: alarm.title ?? "",
                      description: alarm.description ?? "",
                      date: alarm.alarmDate ?? "",
                      time: alarm.alarmTime ?? "",
                      onEdit: () {},
                      onDelete: () {
                        controller.deleteAlarm(alarm.id!.toInt());
                      },
                    );
                  })
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
