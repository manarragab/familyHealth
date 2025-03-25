import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/data/remote_data/response_model.dart';


class PostBMIResponse extends ResponseModel<BMI?> {
    @override
  BMI? data;
  @override
  num? status;
  @override
  String? message;

  PostBMIResponse({
    this.data,
    this.status,
    this.message,
  });

  PostBMIResponse.fromJson(dynamic json) {
    data = json['data'] != null ? BMI.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}


class BMI {
  String? score;
  String? category;
  String? comment;

  BMI({this.score, this.category, this.comment});

  BMI.fromJson(Map<String, dynamic> json) {
    score = json["score"];
    category = json["category"];
    comment = json["comment"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["score"] = score;
    _data["category"] = category;
    _data["comment"] = comment;
    return _data;
  }
}
