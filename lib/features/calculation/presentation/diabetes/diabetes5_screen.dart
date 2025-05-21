import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes6_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/white2Container.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes5Screen extends StatefulWidget {
  @override
  State<Diabetes5Screen> createState() => _Diabetes5ScreenState();
}

class _Diabetes5ScreenState extends State<Diabetes5Screen> {
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
                 
                  widg: Column(
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      DotsbarItem(
                        id: "diabetes5",
                        step: 5,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "BMI",
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      White2container(
                          KEY: "diabetess5",
                          title1: "Please enter your height",
                          title2: "(cm)",
                          measure: "cm"),
                      SizedBox(
                        height: 10,
                      ),
                      White2container(
                          KEY: "diabetes5",
                          title1: "Please enter your wieght",
                          title2: "(kg)",
                          measure: "kg"),
                      SizedBox(
                        height: 30,
                      ),
                      MainButton(
                        width: double.infinity,
                        withShadow: true,
                        onPressed: () {
                          if (controller.postDiabetes.weight != null &&
                              controller.postDiabetes.height != null) {
                            Get.toNamed(CustomPage.diabetes6Page);
                          } else {
                            showToast(
                                "You should set value for height && weight both",
                                MessageErrorType.error);
                          }
                        },
                        radius: 10,
                        height: 46,
                        backgroundColor: CustomColors.darkblue3,
                        titleWidget: Text(
                          CustomTrans.next2.tr,
                          style: GoogleFonts.almarai(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 46,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: CustomColors.darkblue3, width: 2)),
                        child: MaterialButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Back",
                            style: GoogleFonts.almarai(
                              fontSize: 24,
                              color: CustomColors.darkblue3,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
