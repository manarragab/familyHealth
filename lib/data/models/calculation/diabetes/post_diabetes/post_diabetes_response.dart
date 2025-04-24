
import 'package:abg/data/remote_data/response_model.dart';

class PostDiabetesResponse  extends ResponseModel<Diabetes?> {
  Diabetes? data;
  num? status;
  String? message;

  PostDiabetesResponse({this.data, this.status, this.message});

  PostDiabetesResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Diabetes.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status"] = status;
    _data["message"] = message;
    return _data;
  }
}

class Diabetes {
  double? riskResult;

  Diabetes({this.riskResult});

  Diabetes.fromJson(Map<String, dynamic> json) {
    riskResult = json["risk_result"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["risk_result"] = riskResult;
    return _data;
  }
}