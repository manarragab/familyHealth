import 'dart:developer';
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_MD.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_response.dart';
import 'package:abg/data/models/calculation/diabetes/post_diabetes/post_diabetes_MD.dart';
import 'package:abg/data/models/calculation/diabetes/post_diabetes/post_diabetes_response.dart';
import 'package:abg/data/models/calculation/favourite/get_favourite/get_favourite.dart';
import 'package:abg/data/models/calculation/favourite/post_favourite/post_favourite.dart';
import 'package:abg/data/models/calculation/favourite/post_favourite/post_favourite_response.dart';
import 'package:abg/data/models/calculation/period/post_period/post_period.dart';
import 'package:abg/data/models/calculation/period/post_period/post_period_response.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_MD.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_response.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/calculation/domain/cases/calculation_cases.dart';
import 'package:abg/features/calculation/presentation/BmiCalc/BMI2calc_screen.dart';
import 'package:abg/features/calculation/presentation/DuedateCalc/dateCalc_screen.dart';
import 'package:abg/data/models/calculation/IBS/post_IBS/post_IBS_MD.dart';
import 'package:abg/data/models/calculation/IBS/post_IBS/post_IBS_response.dart';
import 'package:abg/res/router/pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';

class Calculationcontroller extends MainGetxController with CustomStateMixin{
//API
  PostBMIResponse responseBMi = PostBMIResponse();
  PostBmiMd postBmi = PostBmiMd();

  PostTrackerMD postTracker = PostTrackerMD();
  PostTrackerResponse responseTracker = PostTrackerResponse();

  PostDiabetesMd postDiabetes = PostDiabetesMd();
  PostDiabetesResponse responseDiabetes = PostDiabetesResponse();

  PostIbsMD postIBS = PostIbsMD();
  PostIbsResponse responseIBS = PostIbsResponse();

  PostFavouriteResponse responseFavourite = PostFavouriteResponse();
  GetFavourites getFavourite = GetFavourites();
  RefreshController refreshController = RefreshController();


RefreshController refreshControllerr=RefreshController();

Postperiod postPeriod = Postperiod();
PostperiodResponse postperiodResponse=PostperiodResponse();

 addPeriod() async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addPeriod(postPeriod);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      postperiodResponse = response as PostperiodResponse;
       Get.toNamed(CustomPage.ovulatePage3);
    });
  }

List<String> calcImages=[
"assets/images/BMI.png",
"assets/images/baby.png",
"assets/images/womb.png",
"assets/images/diabetes.png",
"assets/images/ibs.png",
];


  onRefresh() async {
    getFavourite = await refreshData(
        model: getFavourite,
        futureMethod: () => sl<CalculationCases>().getFavourites(),
        controller: refreshController,
        getPage: (_) => _,
        checkIfEmpty: (data) {
          if (data is GetFavourites) {
        if (data.data?.calculators?.isEmpty??true) {
          data.status = StatusType.empty.index;
        }
      }
     return data;
        });
  }


  addFavourites( String name ,Function() onSuccess ) async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addFavourites(PostFavourite(name:name));
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, onSuccess);
  }

  deleteFavourite(String id,Function() onSuccess) async {
    loadingGetxController.showCustomLoading(id.toString());
    var response = await sl<CalculationCases>().deleteFavourites(id);
    loadingGetxController.hideCustomLoading(id.toString());
    statusError.checkStatus(response, onSuccess);
  }




  addIBS() async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addIBS(postIBS);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      responseIBS = response as PostIbsResponse;
      Get.toNamed(CustomPage.ibsPage6);
    });
  }

  final questions = [
    'Do you get recurring abdominal pain at least 1 day per week?',
    'Have you been getting this pain for at least the last three months?',
    'Is the pain related to opening your bowels?',
    'Has there been a change in how your stool looks?',
    'Is the pain associated with new onset diarrhea?',
  ];

  List<bool?> answers = List.generate(5, (_) => null);

  void storeValues(int index) {
    switch (index) {
      case 0:
        postIBS.recurringAbdominalPain = answers[0];
        print("hhhhhhhhhhh ${postIBS.recurringAbdominalPain}");
        break;

      case 1:
        postIBS.painDurationThreeMonths = answers[1];
        print("ooooooooooooooooooooo ${postIBS.painDurationThreeMonths}");
        break;

      case 2:
        postIBS.painRelatedToBowel = answers[2];
        break;

      case 3:
        postIBS.stoolAppearanceChange = answers[3];
        break;

      case 4:
        postIBS.newOnsetDiarrhea = answers[4];
        break;
    }
  }

  final questions2 = [
    'Is the pain associated with new onset constipation?',
    'Have you experienced sudden changes in bowel habits without an obvious cause (like dieting)?',
    'Have you experienced bleeding from your back passage?',
    'Have you lost weight without trying?',
    'Do you feel any new bulges (masses) in your abdomen?',
  ];

   List<bool?> answers2 = List.generate(5, (_) => null);

  void storeValues2(int index) {
    switch (index) {
      case 0:
        postIBS.newOnsetConstipation = answers2[0];
        print("hhhhhhhhhhh ${postIBS.newOnsetConstipation}");
        break;

      case 1:
        postIBS.suddenBowelHabitChanges = answers2[1];
        print("iiiiiiiiiiiiiiiiiiiii ${postIBS.suddenBowelHabitChanges}");
        break;

      case 2:
        postIBS.rectalBleeding = answers2[2];
        print("ooooooooooooooooooooo ${postIBS.rectalBleeding}");
        break;

      case 3:
        postIBS.unintentionalWeightLoss = answers2[3];
        print("yyyyyyyyyyyyyyyyyy ${postIBS.unintentionalWeightLoss}");
        break;

      case 4:
        postIBS.abdominalMass = answers2[4];
        print("zzzzzzzzzzzzzzzz ${postIBS.abdominalMass}");
        break;
    }
  }

  final questions3 = [
    'Have you had recent unexplained fever, malaise, or night sweats?',
    'Have you had any of these symptoms for the past 6 months?',
    'Is there a family history of colon cancer?',
  ];

   List<bool?> answers3 = List.generate(3, (_) => null);

  void storeValues3(int index) {
    switch (index) {
      case 0:
        postIBS.feverMalaiseNightSweats = answers3[0];
        print("hhhhhhhhhhh ${postIBS.feverMalaiseNightSweats}");
        break;

      case 1:
        postIBS.symptomsPastSixMonths = answers3[1];
        print("iiiiiiiiiiiiiiiiiiiii ${postIBS.symptomsPastSixMonths}");
        break;

      case 2:
        postIBS.familyHistoryColonCancer = answers3[2];
        print("ooooooooooooooooooooo ${postIBS.familyHistoryColonCancer}");
        break;
    }
  }

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


      Get.to(const Bmi2calcScreen());
    });
  }

  addDiabetes() async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addDiabetes(postDiabetes);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      responseDiabetes = response as PostDiabetesResponse;

      print(
          "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq ${responseDiabetes.data?.riskResult}");

      update(['diabetes8']);
      Get.toNamed(CustomPage.diabetes8Page);
    });
  }

  //select gender (diabetes)
  String selectt = "";

  void selectGender(String val, String id) {
    selectt = val;
    postDiabetes.gender = val;
    update([id]);
  }

  addTracker() async {
    loadingGetxController.showLoading();
    var response = await sl<CalculationCases>().addTracker(postTracker);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      log(response.toString());
      responseTracker = response as PostTrackerResponse;

      print(responseTracker.data?.weeksPassed.toString());
      Get.to(const DatecalcScreen());
    });
  }

  //colored bar
 

//white2container , audio bar
  Map<String, double> valuesMap = {};

  double getValue(String key) {
    return valuesMap[key] ?? 50;
  }

  void updateValue(String key, double newValue, String measure) {
    valuesMap[key] = newValue;
    switch (measure) {
      case "cm":
        key == "one" || key == "two"
            ? postBmi.height = newValue.toInt()
            : postDiabetes.height = newValue.toInt();
        break;

      case "kg":
        key == "one" || key == "two"
            ? postBmi.weight = newValue.toInt()
            : postDiabetes.weight = newValue.toInt();
        break;
    }
    update([key]);
  }

  //listDay
  int selectedIndex = 0;

  void list(int value, String id) {
    selectedIndex = value;

    if (id == "diabetes1") {
      postDiabetes.age = value + 10;
    }
     else if (id == "ovulate2") {
      postPeriod.periodDuration  = value + 1;
      print("periodDuration: ${postPeriod.periodDuration}");
    }
  }

//radiooitem
  String? selectedRadio;

  void selected(String val , String id) {
    selectedRadio = val;
    update([id]);
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

  void selecting(String val, String id, bool pressure) {
    selectedRadio = val;
    if (id == "ibs2") {
      if (pressure == true) {
        String x = "49_or_less";
        postIBS.age = x;
        print("ibssssssssssss ${postIBS.age}");
      } else {
        String y = "50_or_more";
        postIBS.age = y;
        print("ibssssssssssss ${postIBS.age}");
      }
    }
    update([id]);
  }

//family diabetes
  String? rad;
  int? num;
  int? num2;

  void radioFamily(String value, String id) {
    rad = value;
    id == "diabetes6"
        ? postDiabetes.familyHistoryOfDiabetes = num
        : postDiabetes.smokingHistory = num2;
  }

//diabetes type2
final List<String> diabetesQuestions =
 ["Are you taking high blood pressure medication?",
 'Do you take steriods?'];

   List<bool?> diabetesAnswers = List.generate(2, (_) => null);

 void storeDiabetesValues(int index) {
    switch (index) {
      case 0:
      postDiabetes.highBloodPressure = diabetesAnswers[0];
        print("111111111111111111  ${postDiabetes.highBloodPressure}");
        break;

      case 1:
      postDiabetes.steroidsUsage = diabetesAnswers[1];
        print("00000000000000000  ${postDiabetes.steroidsUsage}");
        break;
    }}


  void emptyData() {
    selectedRadio = null;
    //postTracker = PostTrackerMD(date: DateTime.now().subtract(const Duration(days: 1)).stringDate);
    postDiabetes = PostDiabetesMd();
    postIBS = PostIbsMD();
    answers = List.generate(5, (_) => null);
    answers2 = List.generate(5, (_) => null);
    answers3 = List.generate(3, (_) => null);
    diabetesAnswers = List.generate(2, (_) => null);
    selectt = "";
    selectedIndex = 0;
    valuesMap = {};
    selectedone = null;
    rad = null;
    num = null;
    num2 = null;
    valuesBar = {};
    idColored = null;
    idd = null;
    selectedRadio=null;
  }
}
