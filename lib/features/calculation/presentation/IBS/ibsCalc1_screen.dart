import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/IBS/ibscalc2_screen.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';

class Ibscalc1Screen extends StatelessWidget {
  const Ibscalc1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Calculationcontroller controller = Get.find();
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
                  Text(
                    CustomTrans.toProvideAccurateAssessment.tr,
                    style: TFonts.almarai(
                      fontSize: 15.w,
                      color: CustomColors.green1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      CustomImage.asset("assets/images/time.png",
                          width: 24, height: 24),
                      Text(
                        CustomTrans.estimatedCompletionTime.tr,
                        style: TFonts.almarai(
                          fontSize: 15.w,
                          color: CustomColors.darkblue3,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    CustomTrans.pleaseAnswerAllQuestionsTruthfully.tr,
                    style: TFonts.almarai(
                      fontSize: 15.w,
                      color: CustomColors.green1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    CustomTrans.whenYouAreReadyTapStart.tr,
                    style: TFonts.almarai(
                      fontSize: 14.w,
                      color: CustomColors.darkblue3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  MainButton(
                    onPressed: () {
                      controller.emptyData();

                      Get.to(Ibscalc2Screen());
                    },
                    title: CustomTrans.started.tr,
                    radius: 10,
                    fontWeight: FontWeight.w400,
                    backgroundColor: CustomColors.darkblue3,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
