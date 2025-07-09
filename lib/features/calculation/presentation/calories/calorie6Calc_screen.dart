import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/white3Container.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';


class Calorie6calcScreen extends StatefulWidget {
  const Calorie6calcScreen({super.key});

  @override
  State<Calorie6calcScreen> createState() => _Calorie6calcScreenState();
}

class _Calorie6calcScreenState extends State<Calorie6calcScreen> {
  @override
  Widget build(BuildContext context) {
    Calculationcontroller controller = Get.find();
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                firstTxt: CustomTrans.controlYourDietWithThisEasyToUseCalorieCalculator.tr,
                centertxt: CustomTrans.calorieCalculator.tr,
                title: CustomTrans.calorie.tr,
                image: "assets/images/fruity.png", // Ensure this asset exists
                
                widg: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      CustomTrans.score.tr,
                      style: GoogleFonts.almarai(
                        color: CustomColors.darkblue3,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    White3container(
                      txt: [
                        CustomTrans.percentage100.tr,
                        CustomTrans.maintainWeight.tr,
                        CustomTrans.zeroKgPerWeek.tr,
                        CustomTrans.caloriesPerDay4069.tr,
                        CustomTrans.caloriesPerDayText.tr
                      ],
                    ),
                    White3container(
                      txt: [
                        CustomTrans.percentage94.tr,
                        CustomTrans.lightWeightLoss.tr,
                        CustomTrans.pointTwoFiveKgPerWeek.tr,
                        CustomTrans.caloriesPerDay3819.tr,
                        CustomTrans.caloriesPerDayText.tr
                      ],
                    ),
                    White3container(
                      txt: [
                        CustomTrans.percentage88.tr,
                        CustomTrans.severeWeightLoss.tr,
                        CustomTrans.pointFiveKgPerWeek.tr,
                        CustomTrans.caloriesPerDay3569.tr,
                        CustomTrans.caloriesPerDayText.tr
                      ],
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
                      // controller.emptyData(); // Uncomment if needed
                      showToast("underDevelopment", MessageErrorType.error);
                    },
                    width: 60,
                    titleWidget: Image.asset(
                      "assets/images/greensign.png", // Ensure this asset exists
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
                      Get.until((route) => Get.currentRoute == CustomPage.layoutPage);
                    },
                    backgroundColor: CustomColors.pink,
                    width: 70,
                    titleWidget: const Icon(Icons.home_outlined ,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
