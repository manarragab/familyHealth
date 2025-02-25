import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/widget/coloredBar.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Bmi2calcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                  heightt: 449,
                  widg: Container(
                    child: Column(
                      children: [
                        Coloredbar(),
                      ],
                    ),
                  )),
              SizedBox(
                height: 17,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 7),
                width: double.infinity,
                height: 149,
                decoration: BoxDecoration(
                    color: CustomColors.lightGreen1,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: CustomColors.green1,
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Normal Weight",
                            style: GoogleFonts.almarai(
                              fontSize: 16,
                              color: CustomColors.darkblack1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "A BMI between 18.5 and 24.9 indicates that you are a healthy weight for your height. By maintaining a healthy weight, you can reduce your risk of developing serious health problems.",
                      style: GoogleFonts.almarai(
                        fontSize: 16,
                        color: CustomColors.darkblack1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
