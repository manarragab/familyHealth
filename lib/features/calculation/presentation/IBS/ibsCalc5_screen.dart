import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/IBS/widget/questions_item.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';

class Ibscalc5Screen extends GetWidget<Calculationcontroller> {
  const Ibscalc5Screen({super.key});

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
                      child: const DotsbarItem(step: 4, id: "ibs")),
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
                          controller.questions3.length,
                          (index) {
                            return QuestionsItem(
                                question:
                                    'Q${index + 1}. ${controller.questions3[index]}',
                                value: controller.answers3[index],
                                onChanged: (val) {
                                  controller.answers3[index] = val;
                                  controller.storeValues3(index);
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
                  LoadingOverLay(
                    showLoadingOnly: true,
                    child: MainButton(
                      onPressed: () {
                        if (controller.postIBS.feverMalaiseNightSweats !=
                                null &&
                            controller.postIBS.symptomsPastSixMonths != null &&
                            controller.postIBS.familyHistoryColonCancer !=
                                null) {
                          controller.addIBS();
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
