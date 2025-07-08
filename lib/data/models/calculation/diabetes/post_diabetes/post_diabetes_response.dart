
import 'package:abg/data/remote_data/response_model.dart';

class PostDiabetesResponse extends ResponseModel<Diabetes?>{
  @override
  Diabetes? data;
  @override
  num? status;
  @override
  String? message;

  PostDiabetesResponse({this.data, this.status, this.message});

  PostDiabetesResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Diabetes.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(data != null) {
      data["data"] = data?.toJson();
    }
    data["status"] = status;
    data["message"] = message;
    return data;
  }
}

class Diabetes {
  double? riskResult;
  String? comment;

  Diabetes({this.riskResult, this.comment});

  Diabetes.fromJson(Map<String, dynamic> json) {
    riskResult = json["risk_result"];
    comment = json["comment"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["risk_result"] = riskResult;
    data["comment"] = comment;
    return data;
  }
  
}