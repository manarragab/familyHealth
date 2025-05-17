import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/calories/calorie2Calc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorieCalc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/listDay_item.dart';
import 'package:abg/features/calculation/presentation/widget/white3Container.dart';
import 'package:google_fonts/google_fonts.dart';

class Calorie6calcScreen extends StatefulWidget {
  @override
  State<Calorie6calcScreen> createState() => _Calorie6calcScreenState();
}

class _Calorie6calcScreenState extends State<Calorie6calcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                firstTxt:
                    "Control your diet with this easy-to-use calorie calculator.",
                centertxt: "Calorie Calculator",
                title: "Calorie",
                image: "assets/images/fruity.png",
                heightt: 534,
                widg: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Score",
                      style: GoogleFonts.almarai(
                        color: CustomColors.darkblue3,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    White3container(
                      txt: [
                        "100%",
                        "Maintain weight",
                        "0 kg/week",
                        "4069.4",
                        "Calories/day"
                      ],
                    ),
                    White3container(
                      txt: [
                        "94%",
                        "light weight loss",
                        "0.25 kg/week",
                        "3819.4",
                        "Calories/day"
                      ],
                    ),
                    White3container(
                      txt: [
                        "88%",
                        "severe weight loss",
                        "0.5 kg/week",
                        "3569.4",
                        "Calories/day"
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.offAll(CaloriecalcScreen());
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/greensign.png",
                        width: 25.9,
                        height: 24,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Recalculation",
                        style: GoogleFonts.almarai(
                          color: CustomColors.green1,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
