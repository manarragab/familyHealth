
import 'package:abg/data/remote_data/response_model.dart';

class PostTrackerResponse  extends ResponseModel<Tracker?>  {
  @override
  Tracker? data;
  @override
  num? status;
  @override
  String? message;

  PostTrackerResponse({this.data, this.status, this.message});

  PostTrackerResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Tracker.fromJson(json["data"]);
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

class Tracker {
  String? expectedPregnancyDate;
  int? weeksPassed;

  Tracker({this.expectedPregnancyDate, this.weeksPassed});

  Tracker.fromJson(Map<String, dynamic> json) {
    expectedPregnancyDate = json["expectedPregnancyDate"];
    weeksPassed = json["weeksPassed"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["expectedPregnancyDate"] = expectedPregnancyDate;
    data["weeksPassed"] = weeksPassed;
    return data;
  }
}