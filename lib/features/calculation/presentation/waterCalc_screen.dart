import 'package:abg/features/calculation/presentation/BMI2calc_screen.dart';
import 'package:abg/features/calculation/presentation/water2Calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/radiooo_item.dart';
import 'package:abg/features/calculation/presentation/widget/white2Container.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WatercalcScreen extends StatelessWidget {
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
                heightt: 636,
                size: 33.5,
                widg: Container(
                    child: Column(
                  children: [
                    White2container(
                        KEY: "five",
                        title1: "your weight",
                        title2: "(kg)",
                        measure: "kg"),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      height: 215,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "  Activity level",
                            style: GoogleFonts.almarai(
                              fontSize: 12,
                              color: CustomColors.darkBlue2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          RadioooItem(title: "Inactive"),
                          RadioooItem(title: "Little activity"),
                          RadioooItem(title: "Average activity"),
                          RadioooItem(title: "Very active"),
                          RadioooItem(title: "So very active"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: MainButton(
                        withShadow: true,
                        onPressed: () {
                          Get.to(Water2calcScreen());
                        },
                        radius: 10,
                        height: 46,
                        backgroundColor: CustomColors.darkblue3,
                        titleWidget: Text(
                          CustomTrans.calculating.tr,
                          style: GoogleFonts.almarai(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ));
  }
}
