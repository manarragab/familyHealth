import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class White3container extends StatelessWidget {
  final List<String> txt;

  White3container({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      height: 71,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                txt[0],
                style: GoogleFonts.almarai(
                  fontSize: 10,
                  color: CustomColors.green1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txt[1],
                    style: GoogleFonts.almarai(
                      fontSize: 16,
                      color: CustomColors.darkblack1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    txt[2],
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      color: CustomColors.darkgrey4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    txt[3],
                    style: GoogleFonts.almarai(
                      fontSize: 16,
                      color: CustomColors.darkblack1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    txt[4],
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      color: CustomColors.darkgrey4,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
