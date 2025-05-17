import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/IBS/widget/questions_item.dart';
import 'package:abg/features/calculation/presentation/diabetes/widget/white4Container.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/white3Container.dart';
import 'package:abg/features/calculation/presentation/widget/whiteContainer.dart';
import 'package:abg/res/router/pages.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Ibscalc4Screen extends GetWidget<Calculationcontroller> {
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
              heightt: 900.h,
              widg: Column(
                children: [
                   SizedBox(
                    height: 15,
                  ),
Container(
  margin: EdgeInsets.symmetric(horizontal: 50.w),
  child: DotsbarItem(step: 3, id: "ibs")),
    SizedBox(
                    height: 20.h,
                  ),
                   Text(
                    "Group2",
                    style: TFonts.almarai(
                      fontSize: 20.w,
                      color: CustomColors.darkblue3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
 SizedBox(
                    height: 20.h,
                  ),

   
    GetBuilder<Calculationcontroller>(builder: (_){
      return  Container(
  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(12)
),
      child: 

Column(
  children: List.generate(controller.questions2.length, (index) {
          return QuestionsItem(
            
            question:'Q${index + 1}. ${controller.questions2[index]}',
            value:  controller.answers2[index],
            onChanged: (val) {
               controller.answers2[index] = val;
               controller.storeValues2(index);
               controller.update();
               });

            },
          ),),);

    }) ,
                                    
                                        SizedBox(
                    height: 30.h,
                  ),

                  MainButton(onPressed: (){


                     if (controller.postIBS.newOnsetConstipation !=null&&

                     controller.postIBS.suddenBowelHabitChanges !=null&&
                     controller.postIBS.rectalBleeding !=null&&
                     controller.postIBS.unintentionalWeightLoss !=null&&
                     controller.postIBS.abdominalMass !=null
                     ) {

Get.toNamed(CustomPage.ibsPage5);                                  } else {
                                    showToast("You should answer the questions",
                                        MessageErrorType.error);
                                  } 

                  } ,
                  title: CustomTrans.next.tr,
                  radius: 10,
                  fontWeight: FontWeight.w400,
                  backgroundColor: CustomColors.darkblue3,
                  ),

SizedBox(height: 10,),
                     MainButton(onPressed: (){
Get.back();
                  } ,
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
