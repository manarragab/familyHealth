import 'package:abg/data/const/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DiseaseCard extends StatelessWidget{

  final String image;
  final String disease;

  const DiseaseCard({super.key, required this.image, required this.disease});
  
  @override
  Widget build(BuildContext context) {
    return Container(
     width:90 ,
height: 90,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10)
),
      child: Card(
color: CustomColors.grey0,
  child: Container(
   // margin: EdgeInsets.all(5),
    child: Column(children: [
      Image.asset(image , height: 60),
    
 
      Flexible(
        child: Text(disease ,style: GoogleFonts.almarai(
         
            
          fontSize: disease.length > 10 ? 10:  disease.length > 15 ? 7 :12,
          fontWeight: FontWeight.w700
        ),
        maxLines: 1,
        ),
      )
    
    ],),
  ),
      ),
    );
  }



  
}