
import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget{
  final String text;
  final Color color;

  const ColoredContainer({super.key, required this.text, required this.color, });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
     padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 18),
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color
      ),
      child: Text(text , style: GoogleFonts.almarai(
         fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
      ),),
    );
  }



  
}