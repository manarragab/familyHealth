
import 'package:abg/data/remote_data/response_model.dart';

class PostTrackerResponse  extends ResponseModel<Tracker?>  {
  Tracker? data;
  num? status;
  String? message;

  PostTrackerResponse({this.data, this.status, this.message});

  PostTrackerResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Tracker.fromJson(json["data"]);
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

class Tracker {
  String? expectedPregnancyDate;
  int? weeksPassed;

  Tracker({this.expectedPregnancyDate, this.weeksPassed});

  Tracker.fromJson(Map<String, dynamic> json) {
    expectedPregnancyDate = json["expectedPregnancyDate"];
    weeksPassed = json["weeksPassed"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["expectedPregnancyDate"] = expectedPregnancyDate;
    _data["weeksPassed"] = weeksPassed;
    return _data;
  }
}