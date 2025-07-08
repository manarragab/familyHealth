import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/calories/calorie3Calc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorie4Calc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorie6Calc_screen.dart';
import 'package:abg/features/calculation/presentation/widget/dotsBar_item.dart';
import 'package:abg/features/calculation/presentation/widget/greenContainer.dart';
import 'package:abg/features/calculation/presentation/widget/radioo_item.dart';
import 'package:google_fonts/google_fonts.dart';

class Calorie5calcScreen extends StatefulWidget {
  const Calorie5calcScreen({super.key});

  @override
  State<Calorie5calcScreen> createState() => _Calorie5calcScreenState();
}

class _Calorie5calcScreenState extends State<Calorie5calcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Greencontainer(
                  firstTxt: CustomTrans
                      .controlYourDietWithThisEasyToUseCalorieCalculator.tr,
                  centertxt: CustomTrans.calorieCalculator.tr,
                  title: CustomTrans.calorie.tr,
                  image: "assets/images/fruity.png",
                  widg: Column(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      DotsbarItem(
                        id: "calorie",
                        step: 5,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        CustomTrans.activity.tr,
                        style: GoogleFonts.almarai(
                          color: CustomColors.darkblue3,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // GridView(

                      //   gridDelegate:    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
                      //   children: [

                      //  //  RadiooItem(title: "jjj", subTitle: "subTitle")
                      //     //Radio(value: value, groupValue: groupValue, onChanged: onChanged)
                      GridView(
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3.2,
                            crossAxisCount: 2,
                            mainAxisSpacing: 9,
                            crossAxisSpacing: 9),
                        children: [
                          RadiooItem(
                            title: CustomTrans.establishedActivityTitle.tr,
                            subTitle:
                                CustomTrans.establishedActivitySubtitle.tr,
                          ),
                          RadiooItem(
                            title: CustomTrans.lightActivityTitle.tr,
                            subTitle: CustomTrans.lightActivitySubtitle.tr,
                          ),
                          RadiooItem(
                            title: CustomTrans.moderateActivityTitle.tr,
                            subTitle: CustomTrans.moderateActivitySubtitle.tr,
                          ),
                          RadiooItem(
                            title: CustomTrans.activeActivityTitle.tr,
                            subTitle: CustomTrans.activeActivitySubtitle.tr,
                          ),
                          RadiooItem(
                            title: CustomTrans.veryActiveActivityTitle.tr,
                            subTitle: CustomTrans.veryActiveActivitySubtitle.tr,
                          ),
                        ],
                      ),
                      const SizedBox(
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
                      const SizedBox(
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
                            CustomTrans.back.tr,
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
