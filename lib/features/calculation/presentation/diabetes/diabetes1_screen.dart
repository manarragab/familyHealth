import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/listDay_item.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Diabetes1Screen extends GetView<Calculationcontroller> {
  const Diabetes1Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Calculationcontroller>(
        id: "diabetes1Screen",
        builder: (_) {
          return Scaffold(
              appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    Greencontainer(
                        firstTxt:
                            "Check your blood sugar risk easily and stay ahead of your health.",
                        centertxt: "Diabetes Type 2 Risk Calculator",
                        title: "Diabetes\nType2\nRisk",
                        image: "assets/svg/diabetes.svg",
                       
                        widg: Column(
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            DotsbarItem(
                              id: "diabetes1",
                              step: 1,
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Text(
                              "Age",
                              style: TFonts.inter(
                                color: CustomColors.darkblue3,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 37,
                            ),
                            ListdayItem(
                              id: "diabetes1",
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            MainButton(
                              withShadow: true,
                              onPressed: () {
                                if (controller.postDiabetes.age != null) {
                                  Get.toNamed(CustomPage.diabetes2Page);
                                } else {
                                  showToast("You should select age",
                                      MessageErrorType.error);
                                }
                              },
                              radius: 10,
                              height: 46,
                              backgroundColor: CustomColors.darkblue3,
                              titleWidget: Text(
                                CustomTrans.next2.tr,
                                style: TFonts.inter(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ));
        });
  }
}
