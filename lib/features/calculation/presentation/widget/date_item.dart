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
              selectedDate: DateTime.now().subtract(const Duration(days: 1)),
              selectionOverlay: Container(
                width: double.infinity,
                height: 60,
              ),
              selectedStyle: TFonts.appBarTitle(
                color: Colors.black,
                fontWeight: TFontWights.medium,
                fontSize: 20,
              ),
              onSelectedItemChanged: (date) =>
                  controller.postTracker.date = DateFormat('yyyy-MM-dd').format(date),
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

  Widget? getSelected(BuildContext context,
      {required int columnCount, required int selectedIndex}) {
    return Container();
  }
}
