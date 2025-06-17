import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/calories/calorie3Calc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorie5Calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/white2Container.dart';
import 'package:google_fonts/google_fonts.dart';

class Calorie4calcScreen extends StatefulWidget {
  @override
  State<Calorie4calcScreen> createState() => _Calorie4calcScreenState();
}

class _Calorie4calcScreenState extends State<Calorie4calcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                   firstTxt: CustomTrans.controlYourDietWithThisEasyToUseCalorieCalculator.tr,
                centertxt: CustomTrans.calorieCalculator.tr,
                title: CustomTrans.calorie.tr,
                  image: "assets/images/fruity.png",
             
                  widg: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      DotsbarItem(
                        id: "calorie",
                        step: 4,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                      CustomTrans.height.tr,
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      White2container(
                          KEY: "four",
                          title1:  CustomTrans.pleaseEnterYourHeight.tr,
                          title2: "(${CustomTrans.cm.tr})",
                          measure: CustomTrans.cm.tr),
                      SizedBox(
                        height: 35,
                      ),
                      MainButton(
                        withShadow: true,
                        onPressed: () {
                          Get.to(Calorie5calcScreen());
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
                            Get.to(Calorie3calcScreen());
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
