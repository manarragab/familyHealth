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
      const FlSpot(0, 0),
      const FlSpot(1, 80),
      const FlSpot(2, 90),
      const FlSpot(3, 85),
      const FlSpot(4, 95),
      const FlSpot(5, 75),
      const FlSpot(6, 100),
      const FlSpot(7, 110),
    ],
    "Weekly": [
      const FlSpot(0, 0),
      const FlSpot(1, 60),
      const FlSpot(2, 110),
      const FlSpot(3, 70),
      const FlSpot(4, 120),
      const FlSpot(5, 80),
      const FlSpot(6, 130),
      const FlSpot(7, 110),
    ],
    "Monthly": [
      const FlSpot(0, 0),
      const FlSpot(1, 70),
      const FlSpot(2, 100),
      const FlSpot(3, 60),
      const FlSpot(4, 120),
      const FlSpot(5, 95),
      const FlSpot(6, 110),
      const FlSpot(7, 110),
    ],
    "Yearly": [
      const FlSpot(0, 0),
      const FlSpot(1, 100),
      const FlSpot(2, 70),
      const FlSpot(3, 120),
      const FlSpot(4, 90),
      const FlSpot(5, 130),
      const FlSpot(6, 110),
      const FlSpot(7, 110),
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
