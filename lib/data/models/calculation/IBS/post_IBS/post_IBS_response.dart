
import 'package:abg/data/remote_data/response_model.dart';

class PostIbsResponse  extends ResponseModel<IBS?>{
  @override
  IBS? data;
  @override
  num? status;
  @override
  String? message;

  PostIbsResponse({this.data, this.status, this.message});

  PostIbsResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : IBS.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["data"] = this.data?.toJson();
    data["status"] = status;
    data["message"] = message;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["category"] = category;
    data["message"] = message;
    return data;
  }
}