import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/calories/calorie3Calc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorieCalc_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes5_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/widget/white4Container.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/listDay_item.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes4Screen extends StatefulWidget {
  @override
  State<Diabetes4Screen> createState() => _Diabetes4ScreenState();
}

class _Diabetes4ScreenState extends State<Diabetes4Screen> {
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
                      "Check your blood sugar risk easily and stay ahead of your health.",
                  centertxt: "Diabetes Type 2 Risk Calculator",
                  title: "Diabetes\nType2\nRisk",
                  image: "assets/svg/diabetes.svg",
                  heightt: 585,
                  widg: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      DotsbarItem(KEY: "diabetes4",),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Steroids Usage",
                        style: TFonts.inter(
                          color: CustomColors.darkblue3,
                          fontSize: 20.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    
                   SizedBox(
                        height: 20,
                      ),
                  
                  
                  White4container(id: "diabetes4" ),
                  
                      SizedBox(
                        height: 30,
                      ),
                      MainButton(
                         width: double.infinity,
                        withShadow: true,
                        onPressed: () {
                         Get.to(Diabetes5Screen());
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
                      SizedBox(
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
                            "Back",
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
