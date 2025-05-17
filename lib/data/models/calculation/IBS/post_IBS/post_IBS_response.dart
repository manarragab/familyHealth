
import 'package:abg/data/remote_data/response_model.dart';

class PostIbsResponse  extends ResponseModel<IBS?>{
  IBS? data;
  num? status;
  String? message;

  PostIbsResponse({this.data, this.status, this.message});

  PostIbsResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : IBS.fromJson(json["data"]);
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

class IBS {
  bool? status;
  String? category;
  String? message;

  IBS({this.status, this.category, this.message});

  IBS.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    category = json["category"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["category"] = category;
    _data["message"] = message;
    return _data;
  }
}