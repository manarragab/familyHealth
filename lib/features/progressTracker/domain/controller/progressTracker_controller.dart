

import 'dart:io';

import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';

class ProgresstrackerController extends MainGetxController{

List<String> images=[
  "assets/images/galery.png",
    "assets/images/greatBoy.png",
  "assets/images/hand.png",

];

List<String> titles=[
"photo tracker" ,"habit tracking","Habit Breaker"
];



  TextEditingController date1Controller=TextEditingController();
    TextEditingController date2Controller=TextEditingController();
  TextEditingController date3Controller=TextEditingController();

    TextEditingController familyController=TextEditingController();
      TextEditingController timeController=TextEditingController();

//radioo
ProgressType? selectRadio;
  void selectradio(ProgressType value) {
    selectRadio = value;
    update();
  }


PeriodType? selectRadioo;
void selectradio2(PeriodType value){
  selectRadioo=value;
  update();
}

  //audio bar
 Map<String, double> valuesMap = {}; 

  double getValue(String key) {
    return valuesMap[key] ?? 50;
  }

  void updateValue(String key, double newValue) {
    valuesMap[key] = newValue;
    update();
  }

File? image;




}