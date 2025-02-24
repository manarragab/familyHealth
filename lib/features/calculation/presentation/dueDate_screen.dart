import 'package:abg/features/calculation/presentation/dateCalc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/date_item.dart';
import 'package:abg/features/calculation/presentation/widget/pinkContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DuedateScreen extends StatefulWidget {
  @override
  State<DuedateScreen> createState() => _DuedateScreenState();
}

class _DuedateScreenState extends State<DuedateScreen> {
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
              image: "assets/images/girl.png",
              widg: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "The first day of the last menstrual cycle",
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      color: CustomColors.darkBlue2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DateItem(),
                  SizedBox(
                    height: 23,
                  ),
                  MainButton(
                    withShadow: true,
                    onPressed: () {
                      Get.to(DatecalcScreen());
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
