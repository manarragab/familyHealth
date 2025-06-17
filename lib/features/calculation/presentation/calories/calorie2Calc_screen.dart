import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/calories/calorie3Calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class Calorie2calcScreen extends StatefulWidget {
  @override
  State<Calorie2calcScreen> createState() => _Calorie2calcScreenState();
}

class _Calorie2calcScreenState extends State<Calorie2calcScreen> {
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
                         step: 2,),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        CustomTrans.gender.tr,
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 65),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset("assets/images/male.png"),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                 CustomTrans.male.tr,
                                  style: GoogleFonts.almarai(
                                    color: CustomColors.darkblack1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("assets/images/female.png"),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  CustomTrans.female.tr,
                                  style: GoogleFonts.almarai(
                                    color: CustomColors.darkblack1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      MainButton(
                        withShadow: true,
                        onPressed: () {
                         Get.to(Calorie3calcScreen());
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
