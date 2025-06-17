import 'package:abg/features/calculation/presentation/ovulation/ovulation2Calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/date_item.dart';
import 'package:abg/features/calculation/presentation/widget/pinkContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OvulationcalcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Pinkcontainer(
              title: "Ovulation",
              firstTxt: CustomTrans.ovulationCalculator.tr,
              image: "assets/images/ballon.png",
              widg: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                   CustomTrans.theFirstDayOfTheLastMenstrualCycle.tr,
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      color: CustomColors.darkBlue2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DateItem(),
                  SizedBox(
                    height: 23,
                  ),
                  MainButton(
                    withShadow: true,
                    onPressed: () {
                      Get.to(Ovulation2calcScreen());
                    },
                    radius: 10,
                    height: 46,
                    backgroundColor: CustomColors.darkpink,
                    titleWidget: Text(
                      CustomTrans.next2.tr,
                      style: GoogleFonts.almarai(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
