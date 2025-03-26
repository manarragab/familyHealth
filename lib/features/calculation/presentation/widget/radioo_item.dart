import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';

class RadiooItem extends StatelessWidget {
  final String title;
  final String subTitle;

  const RadiooItem({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
  
    return GetBuilder<Calculationcontroller>(
      
      builder: (cont) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.grey13,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio(
                value: title,
                groupValue: cont.selectedRadio,
                onChanged: (val) {
                  cont.selectedRadio = val!;
                  cont.update();
                },
               
          activeColor: CustomColors.green1,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.almarai(
                        fontSize: 12,
                        color: CustomColors.darkblack1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6,),
                    Text(
                      subTitle,
                      style: GoogleFonts.almarai(
                        fontSize: 8,
                        color: CustomColors.darkblack1,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
