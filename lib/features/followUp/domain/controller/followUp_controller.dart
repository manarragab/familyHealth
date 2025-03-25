import 'package:abg/data/const/export.dart';
import 'package:fl_chart/fl_chart.dart';

class FollowupController extends MainGetxController {
  List<String> images = [
    "assets/images/follow1.png",
    "assets/images/follow2.png",
    "assets/images/follow3.png"
  ];
  List<String> titles = [
    "Measuring weight",
    "Measuring blood pressure",
    "Measuring blood sugar"
  ];

  String selectedPeriod = "Weekly";
 void updateSelectedPeriod(String newPeriod) {
    selectedPeriod = newPeriod;
    update();
  }
  
  List<String> periods = ["Daily", "Weekly", "Monthly", "Yearly"];
  final days = ["", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];

  Map<String, List<FlSpot>> data = {
    "Daily": [
      FlSpot(0, 0),
      FlSpot(1, 80),
      FlSpot(2, 90),
      FlSpot(3, 85),
      FlSpot(4, 95),
      FlSpot(5, 75),
      FlSpot(6, 100),
      FlSpot(7, 110),
    ],
    "Weekly": [
      FlSpot(0, 0),
      FlSpot(1, 60),
      FlSpot(2, 110),
      FlSpot(3, 70),
      FlSpot(4, 120),
      FlSpot(5, 80),
      FlSpot(6, 130),
      FlSpot(7, 110),
    ],
    "Monthly": [
      FlSpot(0, 0),
      FlSpot(1, 70),
      FlSpot(2, 100),
      FlSpot(3, 60),
      FlSpot(4, 120),
      FlSpot(5, 95),
      FlSpot(6, 110),
      FlSpot(7, 110),
    ],
    "Yearly": [
      FlSpot(0, 0),
      FlSpot(1, 100),
      FlSpot(2, 70),
      FlSpot(3, 120),
      FlSpot(4, 90),
      FlSpot(5, 130),
      FlSpot(6, 110),
      FlSpot(7, 110),
    ],
  };


  //audio bar
 Map<String, double> valuesMap = {}; 

  double getValue(String key) {
    return valuesMap[key] ?? 50;
  }

  void updateValue(String key, double newValue) {
    valuesMap[key] = newValue;
    update();
  }
}
