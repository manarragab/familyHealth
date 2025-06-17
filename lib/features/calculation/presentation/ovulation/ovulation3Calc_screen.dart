import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/pinkContainer.dart';
import 'package:abg/features/calculation/presentation/widget/whiteContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ovulation3calcScreen extends StatefulWidget {
  @override
  State<Ovulation3calcScreen> createState() => _Ovulation3calcScreenState();
}

class _Ovulation3calcScreenState extends State<Ovulation3calcScreen> {
  @override
  Widget build(BuildContext context) {
    Calculationcontroller controller = Get.find();
   final startDate= controller.postperiodResponse.data?.futureCycle?.fertileWindow?.start??"";
      final endtDate= controller.postperiodResponse.data?.futureCycle?.fertileWindow?.end??"";
      final ovulationDate= controller.postperiodResponse.data?.futureCycle?.ovulationDate??"";
      final periodDate= controller.postperiodResponse.data?.currentCycle?.nextPeriodDate??"";
      final dueDate= controller.postperiodResponse.data?.futureCycle?.nextCycleStart??"";
      final duration= controller.postperiodResponse.data?.futureCycle?.daysFromNow??"";

    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Pinkcontainer(
              title: CustomTrans.ovulation.tr,
              image: "assets/images/girl.png",
              widg: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Whitecontainer(
                      image: "assets/images/firtility1.png",
                      title: CustomTrans.fertilityPeriod.tr,
                      subTitle: "($startDate)  TO  ($endtDate)"),
                  SizedBox(
                    height: 11,
                  ),
                  Whitecontainer(
                      image: "assets/images/firtility2.png",
                      title: CustomTrans.nextOvulationDate.tr,
                      subTitle: "$ovulationDate"),
                  SizedBox(
                    height: 11,
                  ),
                  Whitecontainer(
                      image: "assets/images/menstrual.png",
                      title:CustomTrans.nextPeriodDate.tr,
                      subTitle: "$periodDate")
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Whitecontainer(
                image: 'assets/images/pregnant.png',
                title: CustomTrans.yourEstimatedDueDateIs.tr,
                subTitle: "$dueDate   (After $duration Days)",
                col: CustomColors.lightgrey5,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(
                  onPressed: () {
                    controller.emptyData();
                    Get.until(
                        (route) => Get.currentRoute == CustomPage.ovulatePage);
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
                SizedBox(
                  width: 5,
                ),
                MainButton(
                  onPressed: () {
                    Get.until(
                        (route) => Get.currentRoute == CustomPage.layoutPage);
                  },
                  backgroundColor: CustomColors.pink,
                  width: 70,
                  titleWidget:
                      Icon(Icons.home_outlined, size: 30, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
