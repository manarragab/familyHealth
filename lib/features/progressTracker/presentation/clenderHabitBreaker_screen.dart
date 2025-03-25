import 'package:abg/data/const/export.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class ClenderhabitbreakerScreen extends StatelessWidget {
  
  Map<DateTime, bool> selectedDates = {};
  List<DateTimeRange> highlightedRanges = [
    DateTimeRange(start: DateTime(2025, 3, 9), end: DateTime(2025, 3, 10)),
    DateTimeRange(start: DateTime(2025, 3, 12), end: DateTime(2025, 3, 15)),
    DateTimeRange(start: DateTime(2025, 3, 16), end: DateTime(2025, 3, 22)),
    DateTimeRange(start: DateTime(2025, 3, 23), end: DateTime(2025, 3, 28)),
  ];
  List<DateTime> strikethroughDates = [
    DateTime(2025, 3, 11),
    DateTime(2025, 3, 24),
    DateTime(2025, 3, 27),
  ];

  bool isHighlighted(DateTime date) {
    for (var range in highlightedRanges) {
      if (date.isAfter(range.start.subtract(const Duration(days: 1))) && date.isBefore(range.end.add(const Duration(days: 1)))) {
        return true;
      }
    }
    return false;
  }

  bool isStrikethrough(DateTime date) {
    return strikethroughDates.contains(date);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.habitBreaker.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Center(child: Image.asset("assets/images/greenCircle.png")),
            Container(
              height: 100,
            ),
            Divider(
              thickness: 3,
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Name Habit Breaker",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.lighttblue,
                  ),
                ),
                Spacer(),
                InkWell(
                  child: SvgPicture.asset(
                    "assets/svg/clender.svg",
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "13/909/2024",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lighttblue,
                  ),
                ),
                Spacer(),
                InkWell(
                  child: SvgPicture.asset(
                    "assets/svg/clock.svg",
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "15 Day",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lighttblue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 3,
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Did you do an 'example' today?",
                style: GoogleFonts.almarai(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.lighttblue,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainButton(
                    onPressed: () {},
                    title: "Yes I did",
                    width: Get.width * 1 / 3,
                    radius: 7,
                    withShadow: false,
                    height: 42,
                  ),
                  MainButton(
                    onPressed: () {},
                    title: "No I didn't",
                    textColor: Colors.red,
                    backgroundColor: Colors.white,
                    borderColor: Colors.red,
                    width: Get.width * 1 / 3,
                    radius: 7,
                    withShadow: false,
                    height: 42,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 3,
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 5,
            ),

            
 TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime(2020),
          lastDay: DateTime(2030),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, _) {
              bool highlighted = isHighlighted(date);
              bool strikethrough = isStrikethrough(date);
              return Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: highlighted ? Colors.green : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: GoogleFonts.almarai(
                      fontSize: 16,
                      color: highlighted ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: strikethrough ? TextDecoration.lineThrough : TextDecoration.none,
                    ),
                  ),
                ),
              );
            },
          
          ),),
      
          ],
        ),
      ),
    );
  }
}
