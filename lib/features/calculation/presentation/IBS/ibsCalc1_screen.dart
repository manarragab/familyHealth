import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/IBS/ibscalc2_screen.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Ibscalc1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Greencontainer(
              firstTxt:
                  "Easily assess your risk of Irritable Bowel Syndrome (IBS) and take a proactive step toward better digestive health.",
              centertxt: "NEW Calculator",
              title: "Symptom\nChecker\nFor IBS",
              image: "assets/svg/ibs.svg",
              heightt: 615.h,
              widg: Column(
                children: [
                   SizedBox(
                    height: 15,
                  ),
                  Text(
                    "To provide you with an accurate assessment, this tool will guide you through 14 clinically relevant questions, grouped into 4 key categories",
                    style: TFonts.almarai(
                      fontSize: 15.w,
                      color: CustomColors.green1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      CustomImage.asset("assets/images/time.png" , width: 24 , height: 24),
                      Text(
                        "Estimated completion time: Less than 3 minutes",
                        style: TFonts.almarai(
                          fontSize: 15.w,
                          color: CustomColors.darkblue3,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
"Please answer all questions truthfully based on your current health status. Your responses will help us determine whether your symptoms align with IBS or warrant further medical evaluation.",
                    style: TFonts.almarai(
                      fontSize: 15.w,
                      color: CustomColors.green1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "When you're ready, tap 'Start' to begin the assessment",
                    style: TFonts.almarai(
                      fontSize: 14.w,
                      color: CustomColors.darkblue3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
 SizedBox(
                    height: 80.h,
                  ),
                  MainButton(onPressed: (){
Get.to(Ibscalc2Screen());
                  } ,
                  title: CustomTrans.started.tr,
                  radius: 10,
                  fontWeight: FontWeight.w400,
                  backgroundColor: CustomColors.darkblue3,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
