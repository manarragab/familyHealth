import 'dart:developer';

import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_MD.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_response.dart';
import 'package:abg/data/models/calculation/diabetes/post_diabetes/post_diabetes_MD.dart';
import 'package:abg/data/models/calculation/diabetes/post_diabetes/post_diabetes_response.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_MD.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_response.dart';
import 'package:abg/features/calculation/domain/cases/calculation_cases.dart';
import 'package:abg/features/calculation/presentation/BmiCalc/BMI2calc_screen.dart';
import 'package:abg/features/calculation/presentation/DuedateCalc/dateCalc_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes3_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes8_screen.dart';
import 'package:abg/res/router/pages.dart';
import 'package:dio/dio.dart';

class Calculationcontroller extends MainGetxController {
//API
  PostBMIResponse responseBMi = PostBMIResponse();
  PostBmiMd postBmi = PostBmiMd();

  PostTrackerMD postTracker = PostTrackerMD();
  PostTrackerResponse responseTracker = PostTrackerResponse();

  PostDiabetesMd postDiabetes = PostDiabetesMd();
  PostDiabetesResponse responseDiabetes = PostDiabetesResponse();

  String? idd;
  void setId(String id) {
    idd = id;
  }

String? idColored;
  addBmi() async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addBmi(postBmi);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      responseBMi = response as PostBMIResponse;

        updateBmi(responseBMi.data?.score ?? 0.0, Get.width - 80 , idd);
      
      Get.to(Bmi2calcScreen());
    });
  }

  addDiabetes() async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addDiabetes(postDiabetes);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      responseDiabetes = response as PostDiabetesResponse;

print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq ${responseDiabetes.data?.riskResult}");

     updateBmi(responseDiabetes.data?.riskResult?.toDouble() ?? 0.0, Get.width - 80 , idd);
 update(['diabetes8']); 
   Get.to(Diabetes8Screen());
    });
  }

  //select gender (diabetes)
  String selectt="";
  void selectGender(String val , String id){
selectt=val;
 postDiabetes.gender=val;
update([id]);
  }

//due date , tracker
  int? selectedDay;
  int? selectedMonth ;
  int? selectedYear ;

  void postPeroid() {
    try {
      //postTracker.date = "$selectedDay-$selectedMonth-$selectedYear";
      postTracker.date =
          "${selectedYear.toString()}-${selectedMonth.toString().padLeft(2, '0')}-${selectedDay.toString().padLeft(2, '0')}";

      print(" date .................................  ${postTracker.date}");
    } catch (e) {
      print("Error in date: ${postTracker.date}");
    }
    update();
  }

  addTracker() async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addTracker(postTracker);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      log(response.toString());
      responseTracker = response as PostTrackerResponse;

      print(responseTracker.data?.weeksPassed.toString());
      Get.to(DatecalcScreen());
    });
  }

  //colored bar
  double bmiValue = 25.0;
  final double minBmi = 10.0;
  final double maxBmi = 40.0;
  final double speedFactor = 2.5;
  void updateBmi(double newPosition, double barWidth , idd) {
    bmiValue = ((newPosition / barWidth) * (maxBmi - minBmi)) + minBmi;
    bmiValue = bmiValue.clamp(minBmi, maxBmi);
  }

//white2container , audio bar
  Map<String, double> valuesMap = {};

  double getValue(String key) {
    return valuesMap[key] ?? 50;
  }

  void updateValue(String key, double newValue, String measure) {
    valuesMap[key] = newValue;
    switch (measure) {
      case "cm":
    key=="one"||key=="two"? postBmi.height = newValue.toInt() : postDiabetes.height = newValue.toInt();
        break;

      case "kg":
    key=="one"||key=="two"? postBmi.weight = newValue.toInt() : postDiabetes.weight = newValue.toInt();
        break;
    }
    update([key]);
  }

  //listDay
  int selectedIndex = 0;

  void list(int value, String id) {
    selectedIndex = value;

    if (id == "diabetes1") {
      postDiabetes.age = value +10;
    }
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
  void selecting(String val, String id , bool pressure) {
    selectedRadio = val;
    if(id=="diabetes3"){
    postDiabetes.highBloodPressure=pressure;
    print("ddddddddddddddd ${postDiabetes.highBloodPressure}");
    }
    else if(id=="diabetes4"){
postDiabetes.steroidsUsage=pressure;
    }
    update([id]);
  }


//family diabetes
  String? rad;
  int? num;
  int? num2;
  void radioFamily(String value , String id){
    rad=value;
   id=="diabetes6"?postDiabetes.familyHistoryOfDiabetes=num : postDiabetes.smokingHistory=num2;
  }

}
