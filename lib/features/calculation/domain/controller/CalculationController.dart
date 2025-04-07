import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_MD.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_response.dart';
import 'package:abg/features/calculation/domain/cases/calculation_cases.dart';
import 'package:abg/features/calculation/presentation/BMI2calc_screen.dart';

class Calculationcontroller extends MainGetxController {

//API
PostBMIResponse responseBMi=PostBMIResponse();
PostBmiMd postBmi=PostBmiMd();

  addBmi() async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addBmi(postBmi);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
responseBMi=response as PostBMIResponse;
  updateBmi(responseBMi.data?.score?? 0.0  , Get.width-80);
      Get.to(Bmi2calcScreen());
    });
  }



  //colored bar
  double bmiValue = 25.0;
  final double minBmi = 10.0;
  final double maxBmi = 40.0;
  final double speedFactor = 2.5;
  void updateBmi(double newPosition, double barWidth ) {
    bmiValue = ((newPosition / barWidth) * (maxBmi - minBmi)) + minBmi;
    bmiValue = bmiValue.clamp(minBmi, maxBmi);
    update(); 
  }


//white2container
 Map<String, double> valuesMap = {}; 

  double getValue(String key) {
    return valuesMap[key] ?? 50;
  }

  void updateValue(String key, double newValue , String measure) {
    valuesMap[key] = newValue;
   switch(measure){
    case "cm":
    postBmi.height=newValue.toInt();
    break;

    case "kg":
    postBmi.weight=newValue.toInt();
    break;

   }
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

  
