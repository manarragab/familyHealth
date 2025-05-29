import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/calories/calorie2Calc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorieCalc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/listDay_item.dart';
import 'package:abg/features/calculation/presentation/widget/white3Container.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class Calorie6calcScreen extends StatefulWidget {
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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                firstTxt:
                    "Control your diet with this easy-to-use calorie calculator.",
                centertxt: "Calorie Calculator",
                title: "Calorie",
                image: "assets/images/fruity.png",
               
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


 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(
                  onPressed: () {
                   // controller.emptyData();
                   showToast("under devlopment", MessageErrorType.error);

                     },
                  width: 60,
                  titleWidget: Image.asset(
                    "assets/images/greensign.png",
                    width: 25,
                    height: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                  MainButton(
                  onPressed: () {
                    Get.toNamed(CustomPage.layoutPage);
                  },
                  backgroundColor: CustomColors.pink,
                  width: 70,
                 titleWidget: Icon(Icons.home_outlined ,
                 size: 30
                 , color: Colors.white),
                ),

              ],
            ),
          ],

            
          ),
        ));
  }
}
