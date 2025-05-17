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
          builder: (_){
return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                Greencontainer(
                    firstTxt:
                  "Easily assess your risk of Irritable Bowel Syndrome (IBS) and take a proactive step toward better digestive health.",
              centertxt: "NEW Calculator",
              title: "Symptom\nChecker\nFor IBS",
              image: "assets/svg/ibs.svg",
              heightt: 540.h,
                    widg: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Score",
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Coloredbar(
                        id: "ibs6",
                        txt2: ["", "", ""],
                        txt: [
                          "Low Risk",
                          "Normal Risk",
                          "High Risk",
                          "Very High Risk"
                        ],
                       
                      //  subTitle: controller.responseDiabetes.data?.riskResult.toString(),
                      ),
                     SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: CustomColors.redd,
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                      
                            controller.responseIBS.data?.category??"",
                            style: GoogleFonts.almarai(
                              fontSize: 16,
                              color: CustomColors.darkblack1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                        height: 10,
                      ),
                      Text(
                            controller.responseIBS.data?.message??"",

                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ])),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                controller.postIBS=PostIbsMD();
                    Get.until((route)=>Get.currentRoute==CustomPage.ibsPage1);
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/greensign.png",
                          width: 25.9,
                          height: 24,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Recalculation",
                          style: GoogleFonts.almarai(
                            color: CustomColors.green1,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
        }) );
  }
}
