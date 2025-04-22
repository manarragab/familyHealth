import 'dart:developer';

import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_MD.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_response.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_MD.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_response.dart';
import 'package:abg/features/calculation/domain/cases/calculation_cases.dart';
import 'package:abg/features/calculation/presentation/BmiCalc/BMI2calc_screen.dart';
import 'package:abg/features/calculation/presentation/DuedateCalc/dateCalc_screen.dart';
import 'package:dio/dio.dart';

class Calculationcontroller extends MainGetxController {
//API
  PostBMIResponse responseBMi = PostBMIResponse();
  PostBmiMd postBmi = PostBmiMd();

  PostTrackerMD postTracker = PostTrackerMD();
  PostTrackerResponse responseTracker = PostTrackerResponse();

String? idd;
void setId(String id){
  idd=id;
}
  addBmi() async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addBmi(postBmi);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      responseBMi = response as PostBMIResponse;
  
  if( idd=="water2"){
    updateBmi(responseBMi.data?.score ?? 0.0, Get.width - 80  );
  }
      Get.to(Bmi2calcScreen());
    });
  }

//due date , tracker

   int selectedDay=1 ;
   int selectedMonth=1 ;
   int selectedYear=2024 ;

void postPeroid(selectedDay, selectedMonth, selectedYear) {
  try {
    //postTracker.date = "$selectedDay-$selectedMonth-$selectedYear";
    postTracker.date = "${selectedYear.toString()}-${selectedMonth.toString().padLeft(2, '0')}-${selectedDay.toString().padLeft(2, '0')}";

    print(" date .........  ${postTracker.date}");
  } catch (e) {
    print("Error in date: ${postTracker.date}");
  }
  update();
}



  addTracker() async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addTracker(postTracker);
      postPeroid(selectedDay, selectedMonth, selectedYear);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      log(response.toString());
      responseTracker = response as PostTrackerResponse;
      
            print( responseTracker.data?.weeksPassed.toString());
      Get.to(DatecalcScreen());
    });
  }

  //colored bar
  double bmiValue = 25.0;
  final double minBmi = 10.0;
  final double maxBmi = 40.0;
  final double speedFactor = 2.5;
  void updateBmi(double newPosition, double barWidth  ) {
    bmiValue = ((newPosition / barWidth) * (maxBmi - minBmi)) + minBmi;
    bmiValue = bmiValue.clamp(minBmi, maxBmi);
    update();
  }

//white2container
  Map<String, double> valuesMap = {};

  double getValue(String key) {
    return valuesMap[key] ?? 50;
  }

  void updateValue(String key, double newValue, String measure) {
    valuesMap[key] = newValue;
    switch (measure) {
      case "cm":
        postBmi.height = newValue.toInt();
        break;

      case "kg":
        postBmi.weight = newValue.toInt();
        break;
    }
   update([key]);
  
  }

//dotsbar

  Map<String, int> stepsMap = {};

  int getstep(String key) {
    return stepsMap[key] ?? 0;
  }

  void updateStep(String key, int step) {
    stepsMap[key] = step;
update();
  }

  //listDay
  int selectedIndex = 0;

  void list(int value) {
    selectedIndex = value;
  }

//radiooitem
  String? selectedRadio;
  void selected(String val) {
    selectedRadio = val;
    update();
    // select=true;
  }

//radioooitem
  String? selectedone;
  void selectOne(String val) {
    selectedone = val;
    update();
  }

//coloredbar
  Map<String, double> valuesBar = {};

  double getValueBar(String key) {
    return valuesBar[key] ?? 50;
  }

  void updateValueBar(String key, double newValue) {
    valuesBar[key] = newValue;
    update();
  }


//diabetes radio
  String? select;
  void selecting(String val,String id) {
    selectedRadio = val;
    update([id]);
  }

}
