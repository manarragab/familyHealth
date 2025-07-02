import 'package:flutter/cupertino.dart';

class CustomDatePicker {
  Function(DateTime) date;

  CustomDatePicker(this.date);

  final DateTime _date = DateTime.now();
  final double _kPickerSheetHeight = 216.0;
  late int selectedYear = DateTime.now().year;
  final int currentYear = DateTime.now().year;
  final int minYear = 1700;
  final int maxYear = DateTime.now().year;

  showDatePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return _buildBottomPicker(
          CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: _date,
            minimumYear: minYear,
            maximumYear: DateTime.now().year,
            onDateTimeChanged: (DateTime newDateTime) {
              date(newDateTime);
            },
          ),
        );
      },
    );
  }

  showTimePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return _buildBottomPicker(
          CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: _date,
            minimumYear: minYear,
            maximumYear: DateTime.now().year,
            onDateTimeChanged: (DateTime newDateTime) {
              date(newDateTime);
            },
          ),
        );
      },
    );
  }

  showYearPicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return _buildYearPicker();
      },
    );
  }

  Widget _buildYearPicker() {
    final List<Widget> yearWidgets = [];

    for (int year = maxYear; year >= minYear; year--) {
      yearWidgets.add(Text(year.toString()));
    }

    return Container(
      height: 200,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(
          initialItem: maxYear - selectedYear,
        ),
        itemExtent: 40.0,
        onSelectedItemChanged: (int index) {
          selectedYear = maxYear - index;
          date(DateTime(selectedYear));
        },
        children: yearWidgets,
      ),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.inactiveGray,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }


 void showDatePickerEveryDay(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return _buildBottomPicker(
          CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: _date,
            minimumYear: minYear,
            maximumYear: DateTime.now().year,
            onDateTimeChanged: (DateTime newDateTime) {
              date(newDateTime);
            },
          ),
        );
      },
    );
  }



  void showTimePickerEveryHalfHour(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return _buildBottomPicker(
          CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: _roundToNearest30Minutes(_date),
            minimumYear: minYear,
            minuteInterval: 30, // <-- Forces 30-minute increments
            maximumYear: DateTime.now().year,
            onDateTimeChanged: (DateTime newDateTime) {
              date(newDateTime);
            },
          ),
        );
      },
    );
  }

  DateTime _roundToNearest30Minutes(DateTime dateTime) {
    int minute = dateTime.minute;
    int newMinute = (minute < 15)
        ? 0
        : (minute < 45 ? 30 : 0);

    if (minute >= 45) {
      dateTime = dateTime.add(const Duration(hours: 1));
    }

    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      newMinute,
    );
  }



  void showTimePickerEveryQuarterHour(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) {
      return _buildBottomPicker(
        CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          initialDateTime: _roundToNearest15Minutes(_date),
          minuteInterval: 15, // <-- Changed to quarter-hour
          onDateTimeChanged: (DateTime newDateTime) {
            date(newDateTime);
          },
        ),
      );
    },
  );
}

DateTime _roundToNearest15Minutes(DateTime dateTime) {
  int minute = dateTime.minute;
  int newMinute;
  
  if (minute < 8) {
    newMinute = 0;
  } else if (minute < 23) {
    newMinute = 15;
  } else if (minute < 38) {
    newMinute = 30;
  } else if (minute < 53) {
    newMinute = 45;
  } else {
    newMinute = 0;
    dateTime = dateTime.add(const Duration(hours: 1));
  }

  return DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
    dateTime.hour,
    newMinute,
  );
}

}
