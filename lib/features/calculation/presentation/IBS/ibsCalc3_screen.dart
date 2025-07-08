import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/IBS/widget/questions_item.dart';
import 'package:abg/features/calculation/presentation/diabetes/widget/white4Container.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/router/pages.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Ibscalc3Screen extends GetWidget<Calculationcontroller> {
  const Ibscalc3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Greencontainer(
              firstTxt: CustomTrans.easilyAssessYourRiskOfIBS.tr,
              centertxt: CustomTrans.newCalculator.tr,
              title: CustomTrans.symptomCheckerForIBS.tr,
              image: "assets/svg/ibs.svg",
              widg: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 50.w),
                      child: DotsbarItem(step: 2, id: "ibs")),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                   CustomTrans.group2.tr,
                    style: TFonts.almarai(
                      fontSize: 20.w,
                      color: CustomColors.darkblue3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GetBuilder<Calculationcontroller>(builder: (_) {
                    return Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: List.generate(
                          controller.questions.length,
                          (index) {
                            return QuestionsItem(
                                question:
                                    'Q${index + 1}. ${controller.questions[index]}',
                                value: controller.answers[index],
                                onChanged: (val) {
                                  controller.answers[index] = val;
                                  controller.storeValues(index);
                                  controller.update();
                                });
                          },
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 30.h,
                  ),
                  MainButton(
                    onPressed: () {
                      if (controller.postIBS.recurringAbdominalPain != null &&
                          controller.postIBS.painDurationThreeMonths != null &&
                          controller.postIBS.painRelatedToBowel != null &&
                          controller.postIBS.stoolAppearanceChange != null &&
                          controller.postIBS.newOnsetDiarrhea != null) {
                        print(
                            "dddddddddddddddddddd ${controller.postIBS.recurringAbdominalPain}");
                        Get.toNamed(CustomPage.ibsPage4);
                      } else {
                        showToast(CustomTrans.youShouldAnswerTheQuestion.tr,
                            MessageErrorType.error);
                      }
                    },
                    title: CustomTrans.next.tr,
                    radius: 10,
                    fontWeight: FontWeight.w400,
                    backgroundColor: CustomColors.darkblue3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MainButton(
                    onPressed: () {
                      Get.back();
                    },
                    title: CustomTrans.back.tr,
                    radius: 10,
                    fontWeight: FontWeight.w400,
                    backgroundColor: CustomColors.lightGreen1,
                    borderColor: CustomColors.darkblue3,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
