import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/listDay_item.dart';
import 'package:abg/res/router/pages.dart';

class Diabetes1Screen extends StatefulWidget {
  const Diabetes1Screen({
    super.key,
  });

  @override
  State<Diabetes1Screen> createState() => _Diabetes1ScreenState();
}

class _Diabetes1ScreenState extends State<Diabetes1Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Calculationcontroller>(
        id: "diabetes1Screen",
        builder: (controller) {
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
                            DotsbarItem(
                              id: "diabetes1",
                              step: 1,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Text(
                            CustomTrans.age.tr,
                              style: TFonts.inter(
                                color: CustomColors.darkblue3,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 37,
                            ),
                            const ListdayItem(
                              id: "diabetes1",
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            MainButton(
                              withShadow: true,
                              onPressed: () {
                                if (controller.postDiabetes.age != null) {
                                  Get.toNamed(CustomPage.diabetes2Page);
                                } else {
                                  showToast(CustomTrans.youShouldSelectAge.tr,
                                      MessageErrorType.error);
                                }
                              },
                              radius: 10,
                              height: 46,
                              backgroundColor: CustomColors.darkblue3,
                              titleWidget: Text(
                                CustomTrans.next2.tr,
                                style: TFonts.inter(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ));
        });
  }
}
