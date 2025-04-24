import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes8_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/widget/white5Container.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes7Screen extends StatefulWidget {
  @override
  State<Diabetes7Screen> createState() => _Diabetes7ScreenState();
}

class _Diabetes7ScreenState extends State<Diabetes7Screen> {
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
                        KEY: "diabetes5",
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Smoking History",
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
                      id: "diabetes7",
                      Q: "What is your smoking status?", 
                     options: [
                      "Non-Smoker" ,
                      "Former Smoker",
                      "Current Smoker"]),
                  
                     
                      SizedBox(
                        height: 30,
                      ),
                      MainButton(
                        width: double.infinity,
                        withShadow: true,
                        onPressed: () {
                          controller.addDiabetes();
                          Get.to(Diabetes8Screen());
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
