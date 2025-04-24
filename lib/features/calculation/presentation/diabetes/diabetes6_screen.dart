import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes7_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/widget/white5Container.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes6Screen extends StatefulWidget {
  @override
  State<Diabetes6Screen> createState() => _Diabetes6ScreenState();
}

class _Diabetes6ScreenState extends State<Diabetes6Screen> {
        Calculationcontroller controller=Get.find();

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
                  heightt: 638,
                  widg: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      DotsbarItem(
                        step: 6,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Family History of Diabetes",
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                     White5container(
                      id: "diabetes6",
                      Q: "Do any of your first-degree family members have diabetes?", 
                     options: 
                     ["No first-degree family members with diabetes" ,
                      "Parent or sibling with diabetes",
                      "Parent and sibling with diabetes"]),
                  
                     
                      SizedBox(
                        height: 30,
                      ),
                      MainButton(
                        width: double.infinity,
                        withShadow: true,
                        onPressed: () {
                          
                          Get.to(Diabetes7Screen());
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
