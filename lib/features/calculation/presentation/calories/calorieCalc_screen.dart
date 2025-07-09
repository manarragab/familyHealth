import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/calories/calorie2Calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/listDay_item.dart';
import 'package:google_fonts/google_fonts.dart';

class CaloriecalcScreen extends StatefulWidget {
  const CaloriecalcScreen({super.key});

  @override
  State<CaloriecalcScreen> createState() => _CaloriecalcScreenState();
}

class _CaloriecalcScreenState extends State<CaloriecalcScreen> {
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
                        step: 1,),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        CustomTrans.age.tr,
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 37,
                      ),
                      const ListdayItem(id: "calorie1",),
                      const SizedBox(
                        height: 45,
                      ),
                      MainButton(
                        withShadow: true,
                        onPressed: () {

                          Get.to(const Calorie2calcScreen());
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
                    ],
                  ))
            ],
          ),
        ));
  }
}
