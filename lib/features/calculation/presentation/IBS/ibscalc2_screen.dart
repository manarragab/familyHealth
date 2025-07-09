import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/diabetes/widget/white4Container.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/router/pages.dart';

class Ibscalc2Screen extends StatelessWidget {
  Calculationcontroller controller = Get.find();

  Ibscalc2Screen({super.key});

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
                      child: const DotsbarItem(step: 1, id: "ibs")),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                                    CustomTrans.group.tr ,

                    style: TFonts.almarai(
                      fontSize: 20.w,
                      color: CustomColors.darkblue3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  White4container(
                    id: "ibs2",
                    title: CustomTrans.howOldAreYou.tr,
                    txt1: CustomTrans.fortyNineOrLess.tr,
                    txt2: CustomTrans.fiftyOrMore.tr,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  MainButton(
                    onPressed: () {
                      if (controller.postIBS.age != null) {
                        print("dddddddddddddddddddd ${controller.postIBS.age}");
                        Get.toNamed(CustomPage.ibsPage3);
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
