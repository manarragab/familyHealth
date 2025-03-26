import 'package:abg/features/calculation/presentation/dueDate_screen.dart';
import 'package:abg/features/calculation/presentation/ovulationCalc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/pinkContainer.dart';
import 'package:abg/features/calculation/presentation/widget/whiteContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Ovulation3calcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.dueDateCalc.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Pinkcontainer(
              title: "Due date",
              heightt: 443,
              image: "assets/images/girl.png",
              widg: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Whitecontainer(
                      image: "assets/images/firtility1.png",
                      title: "Fertility period",
                      subTitle: "19/09 TO 25/09"),
                  SizedBox(
                    height: 11,
                  ),
                  Whitecontainer(
                      image: "assets/images/firtility2.png",
                      title: "Next ovulation date",
                      subTitle: "17/10/2024"),
                  SizedBox(
                    height: 11,
                  ),
                  Whitecontainer(
                      image: "assets/images/menstrual.png",
                      title: "Next period date",
                      subTitle: "08/10/2024")
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
                title: "Your estimated due date is",
                subTitle: "22/06/2025",
                col: CustomColors.lightgrey5,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Get.off(OvulationcalcScreen());
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
