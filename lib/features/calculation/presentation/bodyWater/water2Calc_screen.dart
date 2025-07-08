import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/coloredBar.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Water2calcScreen extends StatelessWidget {
  const Water2calcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Calculationcontroller calcController = Get.find();
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                centertxt: CustomTrans.bodyWaterCalculator.tr,
                firstTxt: CustomTrans
                    .controlYourDietWithThisEasyToUseCalorieCalculator.tr,
                image: "assets/images/water2.png",
                title: CustomTrans.bodyWater.tr,
                size: 33.5,
                widg: Container(
                    child: Column(
                  children: [
                    Coloredbar(
                      id: "water2",
                      txt2: [
                        CustomTrans.threeLi.tr,
                        CustomTrans.fiveLi.tr,
                        CustomTrans.eightLi.tr,
                      ],
                      txt: const ["", "", "", ""],
                      title: CustomTrans.score.tr,
                      subTitle: "",
                    ),
                    Text(
                      CustomTrans
                          .benefitFromMedicalAdviceAboutTheImportanceOfDrinkingWaterTalkToASpecialistDoctorForGuidanceAndAdvice
                          .tr,
                      style: GoogleFonts.almarai(
                        fontSize: 16,
                        color: CustomColors.darkblack1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainButton(
                    onPressed: () {
                      calcController.emptyData();
                      Get.back();
                    },
                    width: 60,
                    titleWidget: Image.asset(
                      "assets/images/greensign.png",
                      width: 25,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  MainButton(
                    onPressed: () {
                      Get.until(
                          (route) => Get.currentRoute == CustomPage.layoutPage);
                    },
                    width: 70,
                    titleWidget: const Icon(Icons.home_outlined,
                        size: 30, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
