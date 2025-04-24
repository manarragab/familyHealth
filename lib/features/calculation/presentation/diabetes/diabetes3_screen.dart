import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes4_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/widget/white4Container.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class Diabetes3Screen extends StatefulWidget {
  @override
  State<Diabetes3Screen> createState() => _Diabetes3ScreenState();
}

class _Diabetes3ScreenState extends State<Diabetes3Screen> {
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
                  heightt: 585,
                  widg: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      DotsbarItem( step: 3),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "High Blood Pressure Medicines",
                        style: TFonts.inter(
                          color: CustomColors.darkblue3,
                          fontSize: 20.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    
                   SizedBox(
                        height: 20,
                      ),
                  
                  
                  White4container(id: "diabetes3" ),
                  
                      SizedBox(
                        height: 30,
                      ),
                      MainButton(
                         width: double.infinity,
                        withShadow: true,
                        onPressed: () {
                      
                        
                         Get.to(Diabetes4Screen());
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
