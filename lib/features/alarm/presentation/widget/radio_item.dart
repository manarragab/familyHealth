import 'package:abg/features/alarm/domain/controller/alarm_controller.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class RadioItem extends StatefulWidget {
  final String title;

  const RadioItem({super.key, required this.title});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  final AlarmController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<AlarmController>(

          builder: (controller) => Radio(
           
            value: widget.title,
            groupValue: controller.selectRadio,
            onChanged: (val) {
              controller.selectRadio = val;
              controller.update();
            },
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        Text(
          widget.title,
          style: GoogleFonts.almarai(
            fontSize: 16,
            color: CustomColors.lightBlue2,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
