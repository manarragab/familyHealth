import 'package:abg/features/calculation/presentation/bodyWater/waterCalc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/coloredBar.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Water2calcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                centertxt: "Body water Calculator",
                firstTxt:
                    "Control your diet with this easy-to-use calorie calculator.",
                image: "assets/images/water2.png",
                title: "Body water",
                size: 33.5,
                widg: Container(
                    child: Column(
                  children: [
                    Coloredbar(
                      id: "water2",
                      txt2: ["3Li", "5Li", "8Li"],
                      txt: ["", "", "", ""],
                      title: "score",
                      subTitle: "",
                    ),
                    Text(
                      "Benefit from medical advice about the importance of drinking water. Talk to a specialist doctor for guidance and advice",
                      style: GoogleFonts.almarai(
                        fontSize: 16,
                        color: CustomColors.darkblack1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/greensign.png",
                        width: 25.9,
                        height: 24,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Recalculation",
                        style: GoogleFonts.almarai(
                          color: CustomColors.green1,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
