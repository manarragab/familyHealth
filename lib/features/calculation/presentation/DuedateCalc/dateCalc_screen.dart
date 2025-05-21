import 'package:abg/features/calculation/presentation/widget/pinkContainer.dart';
import 'package:abg/features/calculation/presentation/widget/whiteContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';

class DatecalcScreen extends GetView<Calculationcontroller>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.dueDateCalc.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Pinkcontainer(
              title: "Due date",
              heightt: 362,
              image: "assets/images/girl.png",
              widg: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Whitecontainer(
                      image: "assets/images/pregnant.png",
                      title: "Expected birth date",
                      subTitle: controller.responseTracker.data?.expectedPregnancyDate??""),
                  SizedBox(
                    height: 11,
                  ),
                  Whitecontainer(
                      image: "assets/images/loveBook.png",
                      title: "Last menstrual period since",
                      subTitle: controller.responseTracker.data?.weeksPassed.toString()??"")
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: () {
                controller.emptyData();

               Get.back();
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/sign.png",
                      width: 25.9,
                      height: 24,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Recalculation",
                      style: GoogleFonts.almarai(
                        color: CustomColors.darkpink,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
