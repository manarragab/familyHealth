import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_MD.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/BMI2calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/white2Container.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BmicalcScreen extends GetView<Calculationcontroller>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Greencontainer(
                widg: Container(
                    child: Column(
                  children: [
                    White2container(
                     KEY: "one",
                        title1: "Please enter your height",
                        title2: "(cm)",
                        measure: "cm",),
                    White2container(
                      KEY: "two",
                        title1: "your weight", title2: "(kg)", measure: "kg"),
                    SizedBox(
                      height: 23,
                    ),
                    LoadingOverLay(
                      showLoadingOnly: true,
                      child: MainButton(
                         withShadow: true,
                        
                        onPressed: () {
                      controller.addBmi();
                      
                      
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
