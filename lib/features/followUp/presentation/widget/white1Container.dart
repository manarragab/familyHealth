import 'package:abg/data/const/export.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class White1container extends StatelessWidget {
  final String txt;
  final int pressure;
  final double? width;

  const White1container(
      {super.key, required this.txt, required this.pressure, this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          txt,
          style: GoogleFonts.almarai(
            fontSize: 18,
            color: CustomColors.darkblue,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          width: width ?? Get.width * 0.287,
          height: 46,
          decoration: BoxDecoration(
              color: CustomColors.greyy3,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "${pressure}",
              style: GoogleFonts.almarai(
                fontSize: 20,
                color: CustomColors.lighttblue,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    );
  }
}
