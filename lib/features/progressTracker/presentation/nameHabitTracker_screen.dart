import 'package:abg/data/const/export.dart';
import 'package:abg/features/progressTracker/presentation/widget/audioBar.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abg/features/progressTracker/domain/controller/progressTracker_controller.dart';

class NamehabittrackerScreen extends GetWidget<ProgresstrackerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.habitTracker.tr),
      body: ListView(
        children: [
          Container(
              width: double.infinity,
              child: Image.asset(
                "assets/images/cheker.png",
                fit: BoxFit.cover,
              )),
          const SizedBox(height: 10),
          Center(
            child: Text("name habit tracker",
                style: GoogleFonts.almarai(
                  fontSize: 18,
                  color: CustomColors.lightBlue2,
                  fontWeight: FontWeight.w700,
                )),
          ),
          const SizedBox(height: 25),
          Container(
            width: Get.width * 1 / 2,
            margin: EdgeInsets.symmetric(horizontal: Get.width * 1 / 4),
            child: Row(
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    "assets/svg/clender.svg",
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "Daily",
                  style: GoogleFonts.almarai(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lighttblue,
                  ),
                ),
                Spacer(),
                InkWell(
                  child: SvgPicture.asset(
                    "assets/svg/clock.svg",
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "01.30 pm",
                  style: GoogleFonts.almarai(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lighttblue,
                  ),
                ),
                Spacer(),
                Image.asset("assets/images/signs.png"),
                const SizedBox(width: 4),
                Text(
                  "10",
                  style: GoogleFonts.almarai(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lighttblue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 3,
            color: Colors.grey[200],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "Target",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.lighttblue,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Sunday",
                  style: GoogleFonts.almarai(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lighttblue,
                  ),
                ),
                Spacer(),
                Text(
                  "2024/10/01",
                  style: GoogleFonts.almarai(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lighttblue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              ...List.generate(10, (index){
               return Container(
              
                child: 
                
                index==2||index==6?
                Image.asset("assets/images/wrong.png") :
                index==7|| index==8|| index==9 ? Image.asset("assets/images/empty.png") : 
                Image.asset("assets/images/correct.png") 
            
            
                );
              })
            ],),
          ),
          SizedBox(height: 15,),
         Audiobar( KEY: "jj"),
                   SizedBox(height: 8,),

          Divider(
            thickness: 3,
            color: Colors.grey[200],
          ),
         
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "Target",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.lighttblue,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Sunday",
                  style: GoogleFonts.almarai(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lighttblue,
                  ),
                ),
                Spacer(),
                Text(
                  "2024/10/01",
                  style: GoogleFonts.almarai(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lighttblue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              ...List.generate(10, (index){
               return Container(
              
                child:  Image.asset("assets/images/empty.png") 
            
            
                );
              })
            ],),
          ),
          SizedBox(height: 15,),
         Audiobar( KEY: "kk"),
                   SizedBox(height: 8,),

          Divider(
            thickness: 3,
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }
}
