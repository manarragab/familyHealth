import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/domain/controller/alarm_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioItem extends GetView<AlarmController> {
  final AlarmType type;

  const RadioItem({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<  AlarmController>(
      
      builder: (controller) {
      sPrint.info('build :: ${controller.selectRadio}');
     
      return GestureDetector(
        onTap: () {
          controller.selectRadio = type;
          controller.postAlarm.type = type.name;
          controller.update();
        },
        child: Row(
          children: [
            Radio(
             value: type.index,
             groupValue: controller.selectRadio?.index,

  //              value: type.index,
  // groupValue: controller.selectRadio?.index,
              onChanged: (val) {
                controller.selectRadio = type;
                print("xxxxxxxxxxxxxxxxxxxxxxxxx  ${ type.name}");
               controller.postAlarm.type = type.name;
               print("xxxxxxxxxxxxxxxxxxxxxxxxx  ${ controller.postAlarm.type}");
                controller.update();
              },
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Text(
              type.name.tr,
              style: GoogleFonts.almarai(
                fontSize: 16,
                color: CustomColors.lightBlue2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    });
  }
}
