import 'dart:async';

import 'package:abg/data/const/export.dart';
import 'package:abg/features/pills/domain/controller/pils_controller.dart';
import 'package:abg/features/pills/presentation/pils2_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pdfcontainer extends GetView<PilsController>{

final int index;

Pdfcontainer({super.key , required  this.index});

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<PilsController>(builder: (controller){
      bool selected= controller.isSelected==index;
      return InkWell(
        onTap: (){
          controller.select(index);
          Get.to(Pils2Screen());
        },
        child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: CustomColors.lightgrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Image.asset("assets/images/drugs.png"),
              SizedBox(width: 10), 
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// **Title Row**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name Pil",
                          style: GoogleFonts.almarai(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          width: 26,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            color: CustomColors.primary,
                          ),
                          child: Image.asset("assets/images/eye.png"),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
        
                    /// **Description**
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: GoogleFonts.almarai(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                    ),
                    Spacer(), 
        
                    Container(
                      width: 41,
                      height: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: CustomColors.primary,
                      ),
                      child: Center(
                        child: Text(
                          "10 Pils",
                          style: GoogleFonts.almarai(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                                      Spacer(), 
        
                   selected?  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 62,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: CustomColors.darkpinky,
                        ),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: GoogleFonts.almarai(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ):  
                     Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 62,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: CustomColors.darkblue3,
                        ),
                        child: Center(
                          child: Text(
                            "Read",
                            style: GoogleFonts.almarai(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
            ),
      );
    }) ;
  }
}
