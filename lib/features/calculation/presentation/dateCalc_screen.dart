import 'package:abg/features/calculation/presentation/dueDate_screen.dart';
import 'package:abg/features/calculation/presentation/widget/pinkContainer.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DatecalcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.dueDateCalc.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            
            Pinkcontainer(title: "Due date",heightt: 362, image: "assets/images/girl.png", widg: 
            
                 
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                        width: double.infinity,
                        height: 71,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/pregnant.png",
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Expected birth date",
                                  style: GoogleFonts.almarai(
                                    color: CustomColors.darkBlue2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "22/06/2025",
                                  style: GoogleFonts.almarai(
                                    color: CustomColors.darkBlue2,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                  
                  SizedBox(
                    height: 11,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                    width: double.infinity,
                    height: 71,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/loveBook.png",
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Expected birth date",
                              style: GoogleFonts.almarai(
                                color: CustomColors.darkBlue2,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "22/06/2025",
                              style: GoogleFonts.almarai(
                                color: CustomColors.darkBlue2,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
             GestureDetector(
              onTap: (){
                                 Get.off(DuedateScreen());

              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/sign.png",
                      width: 25.9,
                      height: 24,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Recalculation",
                      style: GoogleFonts.almarai(
                        color: CustomColors.darkpink,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
              ],
                  ),
            
            ),
            
            
            
            
            
            
            
            
            
            
           
    
        
    
    );
  }
}
