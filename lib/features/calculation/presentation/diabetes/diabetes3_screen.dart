import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/IBS/widget/questions_item.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes3Screen extends StatefulWidget {
  const Diabetes3Screen({super.key});

  @override
  State<Diabetes3Screen> createState() => _Diabetes3ScreenState();
}

class _Diabetes3ScreenState extends State<Diabetes3Screen> {
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
                        height: 45,
                      ),
                      const DotsbarItem(id: "diabetes3", step: 3),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        CustomTrans.highBloodPressureMedicines.tr,
                        style: TFonts.inter(
                          color: CustomColors.darkblue3,
                          fontSize: 20.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                     // White4container(id: "diabetes3"),

     GetBuilder<Calculationcontroller>(builder: (_){
      return  Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(20),
          child:  QuestionsItem(
                                question:
                                    controller.diabetesQuestions[0],
                                value: controller.diabetesAnswers[0],
                                onChanged: (val) {
                                  controller.diabetesAnswers[0] = val;
                                  controller.storeDiabetesValues(0);
                                  controller.update();
                                }));
     })   ,




                      const SizedBox(
                        height: 30,
                      ),
                      MainButton(
                        width: double.infinity,
                        withShadow: true,
                        onPressed: () {
                          if (controller.postDiabetes.highBloodPressure !=
                              null) {
                            Get.toNamed(CustomPage.diabetes4Page);
                          } else {
                            showToast(                           CustomTrans.youShouldAnswerTheQuestion.tr,

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
