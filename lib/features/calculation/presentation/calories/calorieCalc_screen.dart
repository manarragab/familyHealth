import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/calories/calorie2Calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/listDay_item.dart';
import 'package:google_fonts/google_fonts.dart';

class CaloriecalcScreen extends StatefulWidget {
  @override
  State<CaloriecalcScreen> createState() => _CaloriecalcScreenState();
}

class _CaloriecalcScreenState extends State<CaloriecalcScreen> {
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
                  heightt: 615,
                  widg: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      DotsbarItem( KEY: "one",),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Age",
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 37,
                      ),
                      ListdayItem(id: "calorie1",),
                      SizedBox(
                        height: 45,
                      ),
                      MainButton(
                        withShadow: true,
                        onPressed: () {

                          Get.to(Calorie2calcScreen());
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
