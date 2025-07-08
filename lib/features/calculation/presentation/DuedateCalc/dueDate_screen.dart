import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/widget/date_item.dart';
import 'package:abg/features/calculation/presentation/widget/pinkContainer.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class DuedateScreen extends StatefulWidget {
  const DuedateScreen({super.key});

  @override
  State<DuedateScreen> createState() => _DuedateScreenState();
}

class _DuedateScreenState extends State<DuedateScreen> {
  Calculationcontroller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.dueDateCalc.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Pinkcontainer(
              title: CustomTrans.dueDate.tr,
              firstTxt: CustomTrans.dueDateCalc.tr,
              desc: CustomTrans.calculatingPregnancy.tr,
              image: "assets/images/girl.png",
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
                    height: 15,
                  ),
                  const DateItem(
                    id: "duedate1",
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  LoadingOverLay(
                    showLoadingOnly: true,
                    child: MainButton(
                      withShadow: true,
                      onPressed: () {
                        if (controller.postTracker.date != null) {
                          controller.addTracker();
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
                        CustomTrans.calculate.tr,
                        style: GoogleFonts.almarai(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
