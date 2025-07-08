import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/presentation/widget/alarm_item.dart';
import 'package:abg/features/progressTracker/presentation/addPhoto2_screen.dart';
import 'package:abg/features/progressTracker/presentation/delete_screen.dart';
import 'package:abg/features/progressTracker/presentation/nameHabitTracker_screen.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HabittrackerScreen extends StatelessWidget {
  const HabittrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.habitTracker.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing",
              style: GoogleFonts.almarai(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CustomColors.darkblue,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MainButton(
              onPressed: () {
                Get.to(const Addphoto2Screen());
              },
              radius: 10,
              title: CustomTrans.AddHabitTracking.tr,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 15,
            ),
            ...List.generate(10, (index) {
              return GestureDetector(
                onTap: () {
                  Get.to(NamehabittrackerScreen());
                },
                child: AlarmItem(
                  title: "Name habit tracker",
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing",
                  date: "13/9/2024",
                  time: "01.30 pm",
                //  onEdit: () {},
                  onDelete: () {
                    Get.dialog(
 Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width,
                height: 378,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/all.png"),
                    const SizedBox(
                      height: 19,
                    ),
                    Text( CustomTrans.Areyousureyouwanttodeletehabittracking.tr,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.almarai(
                            fontSize: 20,
                            color: CustomColors.lighttblue2,
                            fontWeight: FontWeight.w700)),
                            const SizedBox(height: 30,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         MainButton(onPressed: (){

                         } , 
                         title: CustomTrans.yes.tr,
                         width: Get.width*1/4,
                         radius: 7,
                         withShadow: false,
                         height: 42,
                         ),
                      
                               MainButton(onPressed: (){
                                Get.back();

                         } , 
                         title:  CustomTrans.no.tr,
                         textColor: Colors.red,
                         backgroundColor: Colors.white,
                         borderColor: Colors.red,
                         width: Get.width*1/4,
                         radius: 7,
                         withShadow: false,
                          height: 42,
                         ),
                        ],
                      ),
                    ),
                  
                  ],
                ),
              ),
            ],
          )),
                    );
                  },
                  sign: true, image: '',
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
