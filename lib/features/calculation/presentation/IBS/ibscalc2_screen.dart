import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/diabetes/widget/white4Container.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/res/router/pages.dart';

class Ibscalc2Screen extends StatelessWidget {
  Calculationcontroller controller = Get.find();

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
            //  heightt: 615.h,
              widg: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 50.w),
                      child: DotsbarItem(step: 1, id: "ibs")),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Group",
                    style: TFonts.almarai(
                      fontSize: 20.w,
                      color: CustomColors.darkblue3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  White4container(
                    id: "ibs2",
                    title: "How old are you ?",
                    txt1: "49 or less",
                    txt2: "50 or more",
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  MainButton(
                    onPressed: () {
                      if (controller.postIBS.age != null) {
                        print("dddddddddddddddddddd ${controller.postIBS.age}");
                        Get.toNamed(CustomPage.ibsPage3);
                      } else {
                        showToast("You should answer the question",
                            MessageErrorType.error);
                      }
                    },
                    title: CustomTrans.next.tr,
                    radius: 10,
                    fontWeight: FontWeight.w400,
                    backgroundColor: CustomColors.darkblue3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MainButton(
                    onPressed: () {
                      Get.back();
                    },
                    title: CustomTrans.back.tr,
                    radius: 10,
                    fontWeight: FontWeight.w400,
                    backgroundColor: CustomColors.lightGreen1,
                    borderColor: CustomColors.darkblue3,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
