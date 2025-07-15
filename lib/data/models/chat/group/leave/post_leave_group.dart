
class PostLeaveGroup {
  num? groupId;
  String? notes;

  PostLeaveGroup({this.groupId, this.notes});

  PostLeaveGroup.fromJson(Map<String, dynamic> json) {
    groupId = json["group_id"];
    notes = json["notes"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["group_id"] = groupId;
    _data["notes"] = notes;
    return _data;
  }
}