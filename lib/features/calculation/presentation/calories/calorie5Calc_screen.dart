import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/calories/calorie3Calc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorie4Calc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorie6Calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/radioo_item.dart';
import 'package:google_fonts/google_fonts.dart';

class Calorie5calcScreen extends StatefulWidget {
  @override
  State<Calorie5calcScreen> createState() => _Calorie5calcScreenState();
}

class _Calorie5calcScreenState extends State<Calorie5calcScreen> {
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
                  heightt: 665,
                  widg: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      DotsbarItem(
                        step: 4,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Activity",
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // GridView(

                      //   gridDelegate:    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
                      //   children: [

                      //  //  RadiooItem(title: "jjj", subTitle: "subTitle")
                      //     //Radio(value: value, groupValue: groupValue, onChanged: onChanged)
                      GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3.2,
                            crossAxisCount: 2,
                            mainAxisSpacing: 9,
                            crossAxisSpacing: 9),
                        children: [
                          RadiooItem(
                              title: "Established",
                              subTitle: "Little or no exercise"),
                          RadiooItem(
                              title: "light ",
                              subTitle: "Exercise 1-3 times a week"),
                          RadiooItem(
                              title: "Moderate",
                              subTitle: "Exercise 4-5 times a week"),
                          RadiooItem(
                              title: "Active",
                              subTitle:
                                  "Exercise daily or vigorously3-4 times a week."),
                          RadiooItem(
                              title: "Very active",
                              subTitle:
                                  "Do intense exercise 6-7 times a week."),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MainButton(
                        withShadow: true,
                        onPressed: () {
                          Get.to(Calorie6calcScreen());
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
                            Get.to(Calorie4calcScreen());
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
