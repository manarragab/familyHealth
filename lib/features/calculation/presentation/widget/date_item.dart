import 'package:abg/data/const/export.dart';
import 'package:abg/res/configuration/cupertino_date_picker/cupertino_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:intl/intl.dart';

class DateItem extends StatefulWidget {
  final String id;
  const DateItem({super.key, required this.id});

  @override
  _DateItemState createState() => _DateItemState();
}

class _DateItemState extends State<DateItem> {
  final DateTime today = DateTime.now();
  final calc = Get.find<Calculationcontroller>();

  @override
  void initState() {
    super.initState();

    // ✅ Set today's day as a string (e.g., '29')
    calc.postTracker.date = DateFormat('dd').format(today);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Calculationcontroller>(
      id: widget.id,
      builder: (controller) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _label("Day"),
                _label("Month"),
                _label("Year"),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
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
              maxDate: DateTime.now(),
              selectedDate: today, // ✅ start with today
              selectionOverlay: Container(
                width: double.infinity,
                height: 60,
              ),
              selectedStyle: TFonts.appBarTitle(
                color: Colors.black,
                fontWeight: TFontWights.medium,
                fontSize: 20,
              ),
              onSelectedItemChanged: (DateTime date) {
                // ✅ Save only the day part as a string (e.g. '29')
              if(widget.id == "duedate1"){
                  controller.postTracker.date =
                    DateFormat('yyyy-MM-dd').format(date);
              }
              else if(widget.id == "ovulate1"){
                  controller.postPeriod.startDate =
                    DateFormat('yyyy-MM-dd').format(date);
              }
                controller.update([widget.id]);
// controller.postTracker.date = DateFormat('yyyy-MM-dd')
//     .format(DateTime.now().subtract(const Duration(days: 1)));
              },
            ),
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
}
