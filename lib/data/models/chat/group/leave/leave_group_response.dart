
import 'package:abg/data/remote_data/response_model.dart';

class LeaveGroupResponse  extends ResponseModel<LeavedGroup?> {
  LeavedGroup? data;
  num? status;
  String? message;

  LeaveGroupResponse({this.data, this.status, this.message});

  LeaveGroupResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : LeavedGroup.fromJson(json["data"]);
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

class LeavedGroup {
  bool? success;
  String? message;
  Data1? data;

  LeavedGroup({this.success, this.message, this.data});

  LeavedGroup.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    data = json["data"] == null ? null : Data1.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data1 {
  Group? group;
  MembershipHistory? membershipHistory;

  Data1({this.group, this.membershipHistory});

  Data1.fromJson(Map<String, dynamic> json) {
    group = json["group"] == null ? null : Group.fromJson(json["group"]);
    membershipHistory = json["membership_history"] == null ? null : MembershipHistory.fromJson(json["membership_history"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(group != null) {
      _data["group"] = group?.toJson();
    }
    if(membershipHistory != null) {
      _data["membership_history"] = membershipHistory?.toJson();
    }
    return _data;
  }
}

class MembershipHistory {
  String? joinedAt;
  String? leftAt;
  String? notes;

  MembershipHistory({this.joinedAt, this.leftAt, this.notes});

  MembershipHistory.fromJson(Map<String, dynamic> json) {
    joinedAt = json["joined_at"];
    leftAt = json["left_at"];
    notes = json["notes"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["joined_at"] = joinedAt;
    _data["left_at"] = leftAt;
    _data["notes"] = notes;
    return _data;
  }
}

class Group {
  int? id;
  String? title;
  int? membersCount;

  Group({this.id, this.title, this.membersCount});

  Group.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    membersCount = json["members_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["members_count"] = membersCount;
    return _data;
  }
}