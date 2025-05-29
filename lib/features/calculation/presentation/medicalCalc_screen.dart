import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/BmiCalc/BMIcalc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorieCalc_screen.dart';
import 'package:abg/features/calculation/presentation/DuedateCalc/dueDate_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes1_screen.dart';
import 'package:abg/features/calculation/presentation/ovulation/ovulationCalc_screen.dart';
import 'package:abg/features/calculation/presentation/bodyWater/waterCalc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/card_item.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalcalcScreen extends StatefulWidget {
  @override
  State<MedicalcalcScreen> createState() => _MedicalcalcScreenState();
}

class _MedicalcalcScreenState extends State<MedicalcalcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 8),
              width: 382,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.lightgrey5,
              ),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero,
                  hintText: "Search medical calculators",
                  hintStyle: GoogleFonts.almarai(
                    fontSize: 12,
                    color: CustomColors.darkgrey3,
                    fontWeight: FontWeight.w700,
                  ),
                  suffixIcon: InkWell(
                    child: Container(
                      width: 11.5,
                      height: 11.5,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          "assets/svg/search.svg",
                          width: 11.5,
                          height: 11.5,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Favorite",
              style: GoogleFonts.almarai(
                fontSize: 18,
                color: CustomColors.darkBlue2,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 13,
            ),
            InkWell(
              onTap: () {
                Get.to(BmicalcScreen());
              },
              child: CardItem(
                image: "assets/images/BMI.png",
                elevation: 0.0,
                title: "BMI Calculator",
                subTitle:
                    "The BMI calculator is a powerful tool for assessing healthy weight and understanding your fitness level.",
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Most important medical calculations ",
              style: GoogleFonts.almarai(
                fontSize: 18,
                color: CustomColors.darkBlue2,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(CustomPage.dueDatePage);
              },
              child: CardItem(
                image: "assets/images/baby.png",
                elevation: 2.3,
                title: "Due date Calculator",
                subTitle:
                    "Pregnancy and childbirth calculator provides information about the due date and helps understand the stages of pregnancy.",
              ),
            ),
            SizedBox(
              height: 7,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(CustomPage.ovulatePage);
              },
              child: CardItem(
                image: "assets/images/womb.png",
                elevation: 2.3,
                title: "Ovulation Calculator",
                subTitle:
                    "It provides an ovulation day calculator to determine the period when the egg is ready for fertilization",
              ),
            ),
            SizedBox(
              height: 7,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(CustomPage.diabetes1Page);
              },
              child: CardItem(
                image: "assets/svg/diabetes.svg",
                elevation: 2.3,
                title: "Diabetes Type2 Risk Calculator",
                subTitle:
                    "It provides an Diabetes Type2 Risk day calculator to determine when the egg is ready for fertilization",
              ),
            ),
            SizedBox(
              height: 7,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(CustomPage.ibsPage1);
              },
              child: CardItem(
                image: "assets/svg/ibs.svg",
                elevation: 2.3,
                title: "Symptom Checker For IBS Calculator",
                subTitle:
                    "It provides an Diabetes Type2 Risk day calculator to determine when the egg is ready for fertilization",
              ),
            ),
            SizedBox(
              height: 7,
            ),
            InkWell(
              onTap: () {
                Get.to(BmicalcScreen());
              },
              child: CardItem(
                image: "assets/images/BMI.png",
                elevation: 2.3,
                title: "BMI Calculator",
                subTitle:
                    "The BMI calculator is a powerful tool for assessing healthy weight and understanding your fitness level.",
              ),
            ),
            SizedBox(
              height: 7,
            ),
            InkWell(
              onTap: () {
                Get.to(CaloriecalcScreen());
              },
              child: CardItem(
                image: "assets/images/fruits.png",
                elevation: 2.3,
                title: "Calorie Calculator",
                subTitle:
                    "This calculator can help you determine the types and amounts of food that suit your needs and track your daily food intake.",
              ),
            ),
            SizedBox(
              height: 7,
            ),
            InkWell(
              onTap: () {
                Get.to(WatercalcScreen());
              },
              child: CardItem(
                image: "assets/images/water.png",
                elevation: 2.3,
                title: "Body water Calculator",
                subTitle:
                    "This calculator can help you determine the types and amounts of food that suit your needs and track your daily food intake.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
