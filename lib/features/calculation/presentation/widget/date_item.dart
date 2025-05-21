
import 'package:abg/data/const/export.dart';
import 'package:abg/res/configuration/cupertino_date_picker/cupertino_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';

class DateItem extends StatefulWidget {
  @override
  _DateItemState createState() => _DateItemState();
}

class _DateItemState extends State<DateItem> {
  final DateTime now = DateTime.now();

  final FixedExtentScrollController _dayController =
      FixedExtentScrollController();
  final FixedExtentScrollController _monthController =
      FixedExtentScrollController();
  final FixedExtentScrollController _yearController =
      FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    // No initial selection, we just allow the user to choose a date.
  }

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
                _label("Day"),
                _label("Month"),
                _label("Year"),
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
            child: CupertinoDatePicker(
              itemExtent: 50,
              minDate: DateTime(2000),
              maxDate: DateTime(2030),
              selectedDate: DateTime.now(),
              useMagnifier: true,
              selectionOverlay: Container(
                width: double.infinity,
                height: 60,
              ),
              selectedStyle: TFonts.appBarTitle(
                color: Colors.black,
                fontWeight: TFontWights.medium,
                fontSize: 20,
              ),
              onSelectedItemChanged: (date) => date,
            ),
            /*      child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Day Picker
                  SizedBox(
                    width: 50,
                    child: ListWheelScrollView.useDelegate(
                      controller: _dayController,
                      itemExtent: 42,
                      physics: FixedExtentScrollPhysics(),
                      diameterRatio: 2.5,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          controller.selectedDay = index + 1;
                          controller.postPeroid(); // Update the selected period
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: now.day, // Days from 1 to today's date
                        builder: (context, i) {
                          final day = i + 1;
                          return Center(
                            child: Text(
                              "$day",
                              style: GoogleFonts.almarai(
                                fontSize: 16,
                                color: (controller.selectedDay == day)
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

                  // Month Picker
                  SizedBox(
                    width: 50,
                    child: ListWheelScrollView.useDelegate(
                      controller: _monthController,
                      itemExtent: 42,
                      physics: FixedExtentScrollPhysics(),
                      diameterRatio: 2.5,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          controller.selectedMonth = index + 1;
                          controller.postPeroid(); // Update the selected period
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: now.month, // Months from 1 to current month
                        builder: (context, i) {
                          final month = i + 1;
                          return Center(
                            child: Text(
                              "$month",
                              style: GoogleFonts.almarai(
                                fontSize: 16,
                                color: (controller.selectedMonth == month)
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

                  // Year Picker
                  SizedBox(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      controller: _yearController,
                      itemExtent: 42,
                      physics: FixedExtentScrollPhysics(),
                      diameterRatio: 2.5,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          controller.selectedYear = 2000 + index;
                          controller.postPeroid(); 
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: now.year - 2000 + 1, 
                        builder: (context, i) {
                          final year = 2000 + i;
                          return Center(
                            child: Text(
                              "$year",
                              style: GoogleFonts.almarai(
                                fontSize: 16,
                                color: (controller.selectedYear == year)
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
            ),*/
          ),
        ],
      );
    });
  }

  Widget _label(String text) {
    return Text(
      text,
      style: GoogleFonts.almarai(
        fontSize: 16,
        color: CustomColors.darkBlue2,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget? getSelected(BuildContext context,
      {required int columnCount, required int selectedIndex}) {
    return Container();
  }
}
