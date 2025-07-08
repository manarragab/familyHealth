import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/diabetes/widget/white5Container.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes7Screen extends StatefulWidget {
  const Diabetes7Screen({super.key});

  @override
  State<Diabetes7Screen> createState() => _Diabetes7ScreenState();
}

class _Diabetes7ScreenState extends State<Diabetes7Screen> {
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
                        height: 30,
                      ),
                      DotsbarItem(
                        id: "diabetes7",
                        step: 7,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                       CustomTrans.smokingHistory.tr,
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      White5container(
                          id: "diabetes7",
                          Q: CustomTrans.whatIsYourSmokingStatus.tr,
                          options: [
                            CustomTrans.nonSmoker.tr,
                           CustomTrans.formerSmoker.tr,
                          CustomTrans.currentSmoker.tr,
                          ]),
                      const SizedBox(
                        height: 30,
                      ),
                      LoadingOverLay(
                        showLoadingOnly: true,
                        child: MainButton(
                          width: double.infinity,
                          withShadow: true,
                          onPressed: () {
                            if (controller.postDiabetes.smokingHistory !=
                                null) {
                              controller.addDiabetes();
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
