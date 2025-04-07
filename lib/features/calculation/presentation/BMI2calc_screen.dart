import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/BMIcalc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/coloredBar.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class Bmi2calcScreen extends GetView<Calculationcontroller>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                  heightt: 449,
                  widg: Container(
                    child: Column(
                      children: [
                        Coloredbar(),
                      ],
                    ),
                  )),
              SizedBox(
                height: 17,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 7),
                width: double.infinity,
                height: 149,
                decoration: BoxDecoration(
                    color: CustomColors.lightGreen1,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: CustomColors.green1,
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Normal Weight",
                            style: GoogleFonts.almarai(
                              fontSize: 16,
                              color: CustomColors.darkblack1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                     controller.responseBMi.data?.comment??"",
                      style: GoogleFonts.almarai(
                        fontSize: 16,
                        color: CustomColors.darkblack1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.off(BmicalcScreen());
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/greensign.png",
                        width: 25.9,
                        height: 24,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Recalculation",
                        style: GoogleFonts.almarai(
                          color: CustomColors.green1,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
