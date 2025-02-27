import 'package:abg/data/const/export.dart';

class Calculationcontroller extends MainGetxController {

  //colored bar
  double bmiValue = 25.0;
  final double minBmi = 10.0;
  final double maxBmi = 40.0;
  final double speedFactor = 2.5;
  void updateBmi(double newPosition, double barWidth) {
    bmiValue = ((newPosition / barWidth) * (maxBmi - minBmi)) + minBmi;
    bmiValue = bmiValue.clamp(minBmi, maxBmi);
    update(); 
  }


//white2container
 Map<String, double> valuesMap = {}; 

  double getValue(String key) {
    return valuesMap[key] ?? 50;
  }

  void updateValue(String key, double newValue) {
    valuesMap[key] = newValue;
    update();
  }

  
//dotsbar
  final int totalSteps = 5;
Map<String,int> stepsMap={};

int getstep(String key){
  return stepsMap[key] ??0;
}
  void updateStep( String key,int step) {
    stepsMap[key] = step;
    update(); 
  
  }



  //listDay
int selectedIndex=0;

void list(int value){
selectedIndex=value;
}


//radiooitem
//  bool select=false;
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
}

  
