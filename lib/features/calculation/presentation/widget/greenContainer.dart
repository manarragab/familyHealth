import 'package:abg/data/const/export.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Greencontainer extends StatelessWidget {
  final String? title;
  final String? image;
  final Widget widg;
  final double? heightt;
  final String? firstTxt;
    final String? centertxt;
    final double? size;


  const Greencontainer({
    super.key,
    this.title,
    this.image, 
    required this.widg,
    this.heightt,
    this.firstTxt,
    this.centertxt,
    this.size
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Text(
          centertxt??  "BMI Calculator",
            style: GoogleFonts.almarai(
              fontSize: 14,
              color: CustomColors.darkBlue2,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
         firstTxt?? "Body mass index is a measure of body fat based on height and weight.",
          style: GoogleFonts.almarai(
            fontSize: 15,
            color: CustomColors.darkBlue2,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          height: heightt ?? 515,
          decoration: BoxDecoration(
              color: CustomColors.lightGreen1,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           title?? "BMI",
                            style: GoogleFonts.almarai(
                              fontSize: size??40,
                              color: CustomColors.green1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Calculator",
                            style: GoogleFonts.almarai(
                              fontSize: 30,
                              color: CustomColors.green1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                   CustomImage.asset(
                    image??  "assets/images/boy.png",
                      width: 160,
                      height: 160,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: widg,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
