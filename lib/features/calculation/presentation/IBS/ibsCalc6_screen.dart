import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/calculation/IBS/post_IBS/post_IBS_MD.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/coloredBar.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class Ibscalc6Screen extends GetWidget<Calculationcontroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: GetBuilder<Calculationcontroller>(
            id: "ibs6",
            builder: (_) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Greencontainer(
                          firstTxt:
                              "Easily assess your risk of Irritable Bowel Syndrome (IBS) and take a proactive step toward better digestive health.",
                          centertxt: "NEW Calculator",
                          title: "Symptom\nChecker\nFor IBS",
                          image: "assets/svg/ibs.svg",
                          widg: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.responseIBS.data?.category ?? "",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.almarai(
                                    fontSize: 16,
                                    color: CustomColors.darkblack1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.responseIBS.data?.message ?? "",
                                  style: GoogleFonts.almarai(
                                    color: CustomColors.darkblue3,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ])),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MainButton(
                            onPressed: () {
                              controller.emptyData();
                              Get.until((route) =>
                                  Get.currentRoute == CustomPage.ibsPage1);
                            },
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
                            width:70,
                            titleWidget:
                      Icon(Icons.home_outlined, size: 30, color: Colors.white),
            
                          ),
                        ],
                      ),
                    ],
                  ));
            }));
  }
}
