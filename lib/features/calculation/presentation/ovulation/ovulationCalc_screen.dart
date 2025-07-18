import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/date_item.dart';
import 'package:abg/features/calculation/presentation/widget/pinkContainer.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class OvulationcalcScreen extends StatelessWidget {
  const OvulationcalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Calculationcontroller controller = Get.find();
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Pinkcontainer(
              title: "Ovulation",
              firstTxt: CustomTrans.ovulationCalculator.tr,
              image: "assets/images/ballon.png",
              widg: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                   CustomTrans.theFirstDayOfTheLastMenstrualCycle.tr,
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      color: CustomColors.darkBlue2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const DateItem(
                    id: "ovulate1",
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  LoadingOverLay(
                    showLoadingOnly: true ,
                    child: MainButton(
                      withShadow: true,
                      onPressed: () {
                    
                    
                      if (controller.postPeriod.startDate != null) {
                         
                            Get.toNamed(CustomPage.ovulatePage2);
                    print("cccccccccccccccdd ${controller.postPeriod.startDate}");
                          } else {
                           
                    controller.postTracker.date = DateFormat('yyyy-MM-dd')
                        .format(DateTime.now().subtract(const Duration(days: 1)));
                            // showToast("You should select menstrual date",
                            //     MessageErrorType.error);
                          }
                          
                      },
                      radius: 10,
                      height: 46,
                      backgroundColor: CustomColors.darkpink,
                      titleWidget: Text(
                        CustomTrans.next2.tr,
                        style: GoogleFonts.almarai(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
