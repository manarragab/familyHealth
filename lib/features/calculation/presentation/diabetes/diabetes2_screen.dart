import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes3_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/widget/gender_item.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes2Screen extends StatefulWidget {
  const Diabetes2Screen({super.key});

  @override
  State<Diabetes2Screen> createState() => _Diabetes2ScreenState();
}

class _Diabetes2ScreenState extends State<Diabetes2Screen> {
  Calculationcontroller controller = Get.find();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Calculationcontroller>(
        id: "diabetes2Screen",
        builder: (_) {
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
                            DotsbarItem(id: "diabetes2", step: 2),
                            const SizedBox(
                              height: 35,
                            ),
                            Text(
                           CustomTrans.gender.tr, 
                              style: TFonts.inter(
                                color: CustomColors.darkblue3,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const GenderItem(id: "diabetes2"),
                            const SizedBox(
                              height: 35,
                            ),
                            LoadingOverLay(
                              showLoadingOnly: true,
                              child: MainButton(
                                width: double.infinity,
                                withShadow: true,
                                onPressed: () {
                                  if (controller.postDiabetes.gender != null) {
                                    Get.toNamed(CustomPage.diabetes3Page);
                                  } else {
                                    showToast("You should select gender",
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
        });
  }
}
