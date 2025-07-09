import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/coloredBar.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class Bmi2calcScreen extends GetView<Calculationcontroller> {
  const Bmi2calcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String obesity = controller.responseBMi.data?.category ?? "";

    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                  widg: Container(
                child: Column(
                  children: [
                    Coloredbar(
                      id: "BMI2",
                      score: controller.responseBMi.data?.score
                              ?.toStringAsFixed(2) ??
                          "",
                      subTitle: controller.responseBMi.data?.category,
                    ),
                  ],
                ),
              )),
              const SizedBox(
                height: 17,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: CustomColors.lightGreen1,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: obesity == 'Class III Obesity' ||
                                        obesity == 'Class I Obesity' ||
                                        obesity == 'Class II Obesity'
                                    ? CustomColors.redd
                                    : obesity == 'Overweight'
                                        ? Colors.yellow
                                        : obesity == 'Normal Weight'
                                            ? CustomColors.green1
                                            : Colors.blue,
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            controller.responseBMi.data?.category ?? "",
                            style: GoogleFonts.almarai(
                              fontSize: 16,
                              color: CustomColors.darkblack1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      controller.responseBMi.data?.comment ?? "",
                      style: GoogleFonts.almarai(
                        fontSize: 16,
                        color: CustomColors.darkblack1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainButton(
                    onPressed: () {
                      controller.emptyData();
                      Get.back();
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
                      Get.until(
                          (route) => Get.currentRoute == CustomPage.layoutPage);
                    },
                    width: 70,
                    titleWidget: const Icon(Icons.home_outlined,
                        size: 30, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
