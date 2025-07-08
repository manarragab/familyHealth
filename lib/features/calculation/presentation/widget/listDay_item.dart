import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListdayItem extends StatefulWidget{
  final String id;
  const ListdayItem({super.key, required this.id});

  
  @override
  State<ListdayItem> createState() => _ListdayItemState();
}

class _ListdayItemState extends State<ListdayItem> {
  Calculationcontroller cont=Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GetBuilder<Calculationcontroller>(
        id: widget.id,
        builder: (context){

return  Center(
                child: SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 38,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.15),
                        ),
                      ),
                      ListWheelScrollView.useDelegate(
                        itemExtent: 33,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (i) {
                          setState(() {
                           cont.selectedIndex= i;
                           cont.list(i ,widget.id );
                           cont.update([widget.id]);
                          });
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount:   widget.id=="diabetes1"? 100: 31,
                          builder: (context, i) {
                            return Text(
                     widget.id=="diabetes1"?  "${i+10} Year": "${i + 1} Day",
                              style: TFonts.inter(
                                fontSize: 23,
                                color: i ==cont.selectedIndex
                                    ? CustomColors.darkBlue2
                                    : CustomColors.lightblue3,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
              

      }),  

    );
  }
}