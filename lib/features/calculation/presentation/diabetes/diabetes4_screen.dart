import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/IBS/widget/questions_item.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes4Screen extends StatefulWidget {
  const Diabetes4Screen({super.key});

  @override
  State<Diabetes4Screen> createState() => _Diabetes4ScreenState();
}

class _Diabetes4ScreenState extends State<Diabetes4Screen> {
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
                  firstTxt: CustomTrans
                      .checkYourBloodSugarRiskEasilyAndStayAheadOfYourHealth.tr,
                  centertxt: CustomTrans.diabetesType2RiskCalculator.tr,
                  title: CustomTrans.diabetesType2Risk.tr,
                  image: "assets/svg/diabetes.svg",
                  widg: Column(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      DotsbarItem(
                        id: "diabetes4",
                        step: 4,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        CustomTrans.steroidsUsage.tr,
                        style: TFonts.inter(
                          color: CustomColors.darkblue3,
                          fontSize: 20.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // White4container(
                      //   title: "Do you take steroids?",
                      //   id: "diabetes4"),

                      GetBuilder<Calculationcontroller>(builder: (_) {
                        return Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: QuestionsItem(
                                question: controller.diabetesQuestions[1],
                                value: controller.diabetesAnswers[1],
                                onChanged: (val) {
                                  controller.diabetesAnswers[1] = val;
                                  controller.storeDiabetesValues(1);
                                  controller.update();
                                }));
                      }),

                      const SizedBox(
                        height: 30,
                      ),
                      MainButton(
                        width: double.infinity,
                        withShadow: true,
                        onPressed: () {
                          if (controller.postDiabetes.steroidsUsage != null) {
                            Get.toNamed(CustomPage.diabetes5Page);
                          } else {
                            showToast(CustomTrans.youShouldAnswerTheQuestion.tr,
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
