import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/progressTracker/domain/controller/progressTracker_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class Radioo extends GetView<ProgresstrackerController> {
  final ProgressType? type;
  final PeriodType? period;
  final String ID;

  const Radioo({
   
    super.key,
    required this.ID, 
    this.type,
    this.period,

  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgresstrackerController>(   id: ID  ,builder: (controller) {
  
      sPrint.info('build :: ${controller.selectRadio}');
      return GestureDetector(
        onTap: () {
          if (type != null) {
            controller.selectRadio = type;
                controller.update([ID]);
          } else if (period != null) {
            controller.selectRadioo = period;
                controller.update([ID]);
          }
          // controller.postAlarm.type = type.name;
        },
        child: Row(
          children: [
            Radio(
              value: type == null
                  ? controller.selectRadioo?.index
                  : controller.selectRadio?.index,
              groupValue: type == null ? period?.index : type?.index,
              onChanged: (val) {
                if (type != null) {
                  controller.selectradio(type!);
                } else if (period != null) {
                  controller.selectradio2(period!);
                }
                controller.update([ID]);
              },
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Text(
              type != null ? type!.name.tr : period!.name.tr,
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
