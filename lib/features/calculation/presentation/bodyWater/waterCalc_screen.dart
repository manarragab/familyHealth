import 'package:abg/features/calculation/presentation/bodyWater/water2Calc_screen.dart';
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
  const WatercalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                centertxt: CustomTrans.bodyWaterCalculator.tr,
                firstTxt: CustomTrans.controlYourDietWithThisEasyToUseCalorieCalculator.tr,
                image: "assets/images/water2.png",
                title: CustomTrans.bodyWater.tr,
                size: 33.5,
                widg: Container(
                    child: Column(
                  children: [
                    White2container(
                        KEY: "five",
                        title1: CustomTrans.yourWieght.tr,
                        title2: "(${CustomTrans.kg.tr})",
                        measure: CustomTrans.kg.tr),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: 215,
                      decoration: BoxDecoration(
                          boxShadow: const [
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
                            CustomTrans.activityLevel.tr,
                            style: GoogleFonts.almarai(
                              fontSize: 12,
                              color: CustomColors.darkBlue2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          RadioooItem(title: CustomTrans.inactive.tr),
                          RadioooItem(title: CustomTrans.littleActivity.tr),
                          RadioooItem(title: CustomTrans.averageActivity.tr),
                          RadioooItem(title: CustomTrans.veryActive.tr),
                          RadioooItem(title: CustomTrans.soVeryActive.tr),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: const BoxDecoration(
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
                          Get.to(const Water2calcScreen());
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
