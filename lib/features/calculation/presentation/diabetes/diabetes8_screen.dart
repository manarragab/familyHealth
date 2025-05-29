import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/calculation/diabetes/post_diabetes/post_diabetes_MD.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/coloredBar.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes8Screen extends StatefulWidget {
  @override
  State<Diabetes8Screen> createState() => _Diabetes8ScreenState();
}

class _Diabetes8ScreenState extends State<Diabetes8Screen> {
  Calculationcontroller controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
                    widg: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Score",
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Coloredbar(
                      //   id: "diabetes8",
                      //   txt2: ["", "", ""],
                      //   txt: [
                      //     "Low Risk",
                      //     "Normal Risk",
                      //     "High Risk",
                      //     "Very High Risk"
                      //   ],
                      //   title: "score",
                      //   subTitle: controller.responseDiabetes.data!.riskResult
                      //       ?.toStringAsFixed(2),
                      // ),

                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${controller.responseDiabetes.data!.riskResult?.toStringAsFixed(2) ?? ""} %",
                        style: GoogleFonts.almarai(
                          color: CustomColors.primary,
                          fontSize: 24.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Right now, your risk for having type 2 diabetes is low. However, your risk changes over time. Be sure to schedule regular check-ups with your doctor and take healthy steps toward preventing or delaying diabetes.",
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainButton(
                      onPressed: () {
                        controller.emptyData();
                        Get.until((route) =>
                            Get.currentRoute == CustomPage.diabetes1Page);
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
                    Get.toNamed(CustomPage.homePage);
                  },
                  backgroundColor: CustomColors.pink,
                  width: 70,
                 titleWidget: Icon(Icons.home_outlined ,
                 size: 30
                 , color: Colors.white),
                ),
                  ],
                ),
              ],
            )));
  }
}
