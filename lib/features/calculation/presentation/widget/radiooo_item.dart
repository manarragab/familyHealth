import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioooItem extends StatelessWidget {
  final String title;

  RadioooItem({super.key, required this.title});

  final Calculationcontroller cont = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Calculationcontroller>(builder: (cont) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
            value: title,
            groupValue: cont.selectedone,
            onChanged: (val) {
              cont.selectedone = val!;
              cont.update();
            },
            activeColor: CustomColors.green1,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
           visualDensity: VisualDensity(horizontal: -4, vertical: -1.7), 

          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: GoogleFonts.almarai(
              fontSize: 14,
              color: CustomColors.grey12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    });
  }
}
