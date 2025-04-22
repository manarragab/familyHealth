import 'dart:developer';

import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abg/res/configuration/color.dart';

class DateItem extends StatefulWidget {
  @override
  _DateItemState createState() => _DateItemState();
}

class _DateItemState extends State<DateItem> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Calculationcontroller>(builder: (controller) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Day",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    color: CustomColors.darkBlue2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Month",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    color: CustomColors.darkBlue2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Year",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    color: CustomColors.darkBlue2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: CustomColors.darkpink,
                width: 2,
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 42,
                      physics: FixedExtentScrollPhysics(),
                      diameterRatio: 2.5,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          controller.selectedDay = index + 1;
                         
                          controller.postPeroid(controller.selectedDay,
                              controller.selectedMonth, controller.selectedYear);
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 30,
                        builder: (context, i) {
                          return Center(
                            child: Text(
                              "${i + 1}",
                              style: GoogleFonts.almarai(
                                fontSize: 16,
                                color: (i + 1 == controller.selectedDay)
                                    ? Colors.black
                                    : CustomColors.darkBlue2,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 42,
                      physics: FixedExtentScrollPhysics(),
                      diameterRatio: 2.5,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          controller.selectedMonth = index + 1;
                          print("gggggggggggggggg ${controller.selectedMonth}");
                          controller.postPeroid(controller.selectedDay,
                              controller.selectedMonth, controller.selectedYear);
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 12,
                        builder: (context, i) {
                          return Center(
                            child: Text(
                              "${i + 1}",
                              style: GoogleFonts.almarai(
                                fontSize: 16,
                                color: (i + 1 == controller.selectedMonth)
                                    ? Colors.black
                                    : CustomColors.darkBlue2,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 42,
                      physics: FixedExtentScrollPhysics(),
                      diameterRatio: 2.5,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          controller.selectedYear = 2025 + index;
                         
                          controller.postPeroid(controller.selectedDay,
                              controller.selectedMonth, controller.selectedYear);
                          
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 100,
                        builder: (context, i) {
                          return Center(
                            child: Text(
                              "${2025 + i}",
                              style: GoogleFonts.almarai(
                                fontSize: 16,
                                color: (2025 + i == controller.selectedYear)
                                    ? Colors.black
                                    : CustomColors.darkBlue2,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
