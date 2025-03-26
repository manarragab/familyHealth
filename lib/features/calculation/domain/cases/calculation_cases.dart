import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_MD.dart';
import 'package:abg/data/models/calculation/BMI/post_BMI/post_BMI_response.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';

class CalculationCases {
    final DomainData _data;

    CalculationCases(this._data);



    
  Future<ResponseModel<BMI?>> addBmi(PostBmiMd post) {
    return _data.addBmi(post);
  }

}