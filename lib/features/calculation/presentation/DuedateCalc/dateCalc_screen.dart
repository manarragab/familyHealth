import 'package:abg/features/calculation/presentation/widget/pinkContainer.dart';
import 'package:abg/features/calculation/presentation/widget/whiteContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';

class DatecalcScreen extends GetView<Calculationcontroller>{
  const DatecalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.dueDateCalc.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Pinkcontainer(
                title: CustomTrans.dueDate.tr,
              firstTxt: CustomTrans.dueDateCalc.tr,
              desc: CustomTrans.calculatingPregnancy.tr,
              heightt: 362,
              image: "assets/images/girl.png",
              widg: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Whitecontainer(
                      image: "assets/images/pregnant.png",
                      title: CustomTrans.expectedBirthDate.tr,
                      subTitle: controller.responseTracker.data?.expectedPregnancyDate??""),
                  const SizedBox(
                    height: 11,
                  ),
                  Whitecontainer(
                    week: true,
                      image: "assets/images/loveBook.png",
                      title:CustomTrans.lastMenstrualPeriodSince.tr,
                      subTitle: controller.responseTracker.data?.weeksPassed.toString()??"")
               
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),

 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(
                  onPressed: () {
                    controller.emptyData();
                  
                  Get.back();
                  },
                 backgroundColor: CustomColors.pink,
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
                  backgroundColor: CustomColors.pink,
                  width: 70,
                 titleWidget: const Icon(Icons.home_outlined ,
                 size: 30
                 , color: Colors.white),
                ),
              ],
            ),
        
          ],
        ),
      ),
    );
  }
}
