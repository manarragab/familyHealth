import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes6_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/white2Container.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes5Screen extends StatefulWidget {
  const Diabetes5Screen({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                 firstTxt:CustomTrans.checkYourBloodSugarRiskEasilyAndStayAheadOfYourHealth.tr,
                        centertxt:   CustomTrans.diabetesType2RiskCalculator.tr,
                        title: CustomTrans.diabetesType2Risk.tr,
                  image: "assets/svg/diabetes.svg",
                 
                  widg: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      DotsbarItem(
                        id: "diabetes5",
                        step: 5,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                       CustomTrans.bmi.tr,
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      White2container(
                          KEY: "diabetess5",
                          title1: CustomTrans.pleaseEnterYourHeight.tr,
                          title2: "(${CustomTrans.cm.tr})",
                          measure: CustomTrans.cm.tr),
                      const SizedBox(
                        height: 10,
                      ),
                      White2container(
                          KEY: "diabetes5",
                          title1: CustomTrans.pleaseEnterYourWeight.tr,
                          title2: "(${CustomTrans.kg.tr})",
                          measure: CustomTrans.kg.tr),
                      const SizedBox(
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
                               CustomTrans.youShouldSetValueForHeightWeightBoth.tr,
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
                      const SizedBox(
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
                         CustomTrans.back.tr,
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
