import 'package:abg/data/const/enums.dart';

class PostFavourite {
  PostFavourite({required this.calculatorType});

  CalculationTypes? calculatorType;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    String calculationName;
    switch (calculatorType) {
      case CalculationTypes.bmi:
        calculationName = "bmi";
        break;
      case CalculationTypes.pregnancyTracker:
        calculationName = "pregnancy-tracker";
        break;
      case CalculationTypes.periodCalculator:
        calculationName = "period-calculator";
        break;
      case CalculationTypes.diabetesCalculator:
        calculationName = " diabetes-calculator";

        break;
      case CalculationTypes.ibsSymptomAssessment:
        calculationName = "ibs-symptom-assessment";

        break;

      default:
        calculationName = "unknown";
    }
    _data["calculator_name"] = calculationName;
    return _data;
  }
}
