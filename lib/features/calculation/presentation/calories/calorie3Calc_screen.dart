import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/calories/calorie2Calc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorie4Calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/white2Container.dart';
import 'package:google_fonts/google_fonts.dart';

class Calorie3calcScreen extends StatefulWidget {
  const Calorie3calcScreen({super.key});

  @override
  State<Calorie3calcScreen> createState() => _Calorie3calcScreenState();
}

class _Calorie3calcScreenState extends State<Calorie3calcScreen> {
  @override
  Widget build(BuildContext context) {
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
                  image: "assets/images/fruity.png",
                
                  widg: Column(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      const DotsbarItem(
                        id: "calorie",
                        step: 3,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                       CustomTrans.weight.tr,
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      White2container(
                        KEY: "three",
                          title1: CustomTrans.yourWieght.tr, title2: "(${CustomTrans.kg.tr})", measure: CustomTrans.kg.tr),
                      const SizedBox(
                        height: 35,
                      ),
                      MainButton(
                       withShadow: true,
                        onPressed: () {
                       Get.to(const Calorie4calcScreen());
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

                            Get.to(const Calorie2calcScreen());
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
