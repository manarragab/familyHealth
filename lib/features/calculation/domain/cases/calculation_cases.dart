import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_MD.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_response.dart';
import 'package:abg/data/models/calculation/diabetes/post_diabetes/post_diabetes_MD.dart';
import 'package:abg/data/models/calculation/diabetes/post_diabetes/post_diabetes_response.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_MD.dart';
import 'package:abg/data/models/calculation/pregnancyTracker/post_tracker/post_tracker_response.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';

class CalculationCases {
    final DomainData _data;

    CalculationCases(this._data);
    
  Future<ResponseModel<BMI?>> addBmi(PostBmiMd post) {
    return _data.addBmi(post);
  }

 Future<ResponseModel<Tracker?>> addTracker(PostTrackerMD post) {
    return _data.addTracker(post);
  }

 Future<ResponseModel<Diabetes?>> addDiabetes(PostDiabetesMd post) {
    return _data.addDiabetes(post);
  }


  
}