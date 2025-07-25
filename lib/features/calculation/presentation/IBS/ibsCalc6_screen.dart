import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class Ibscalc6Screen extends GetWidget<Calculationcontroller> {
  const Ibscalc6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: GetBuilder<Calculationcontroller>(
            id: "ibs6",
            builder: (_) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Greencontainer(
                          firstTxt: CustomTrans.easilyAssessYourRiskOfIBS.tr,
                          centertxt: CustomTrans.newCalculator.tr,
                          title: CustomTrans.symptomCheckerForIBS.tr,
                          image: "assets/svg/ibs.svg",
                          widg: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.responseIBS.data?.category ?? "",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.almarai(
                                    fontSize: 16,
                                    color: CustomColors.darkblack1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.responseIBS.data?.message ?? "",
                                  style: GoogleFonts.almarai(
                                    color: CustomColors.darkblue3,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
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
                                  Get.currentRoute == CustomPage.ibsPage1);
                            },
                            width: 60,
                            titleWidget: Image.asset(
                              "assets/images/greensign.png",
                              width: 25,
                              height: 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          MainButton(
                            onPressed: () {
                              Get.until((route) =>
                                  Get.currentRoute == CustomPage.layoutPage);
                            },
                            width: 70,
                            titleWidget: const Icon(Icons.home_outlined,
                                size: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ));
            }));
  }
}
