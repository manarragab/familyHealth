import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/ovulation/ovulation3Calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/listDay_item.dart';
import 'package:abg/features/calculation/presentation/widget/pinkContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/res/configuration/toast_utils.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Ovulation2calcScreen extends StatefulWidget {
  @override
  State<Ovulation2calcScreen> createState() => _Ovulation2calcScreenState();
}

class _Ovulation2calcScreenState extends State<Ovulation2calcScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Calculationcontroller controller = Get.find();
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Pinkcontainer(
          title: CustomTrans.ovulation.tr,
          firstTxt: CustomTrans.ovulationCalculator.tr,
          image: "assets/images/ballon.png",
          widg: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                CustomTrans.theTimePeriodForTheLengthOfTheMenstrualCycle.tr,
                style: GoogleFonts.almarai(
                  fontSize: 13.7,
                  color: CustomColors.darkBlue2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListdayItem(
                id: "ovulate2",
              ),
              SizedBox(
                height: 15,
              ),
              LoadingOverLay(
                showLoadingOnly: true ,
                child: MainButton(
                  onPressed: () {
                    if (controller.postPeriod.periodDuration != null) {
                      controller.addPeriod();
                
                      print(
                          "dddddddddddddddddd ${controller.postPeriod.periodDuration}");
                    } else {
                     controller.postPeriod.periodDuration=1;
                       controller.addPeriod();
                      print(
                          "dddddddddddddddddd ${controller.postPeriod.periodDuration}");
                    }
                  },
                  radius: 10,
                  height: 46,
                  backgroundColor: CustomColors.darkpink,
                  titleWidget: Text(
                    CustomTrans.calculate.tr,
                    style: GoogleFonts.almarai(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
