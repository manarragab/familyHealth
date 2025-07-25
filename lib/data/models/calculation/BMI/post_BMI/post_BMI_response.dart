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
  double? score;
  String? category;
  String? comment;

  BMI({this.score, this.category, this.comment});

  BMI.fromJson(Map<String, dynamic> json) {
    score = double.tryParse(json["score"].toString());
    category = json["category"];
    comment = json["comment"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["score"] = score;
    data["category"] = category;
    data["comment"] = comment;
    return data;
  }
}
