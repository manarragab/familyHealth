class PostAssignUser {
  PostAssignUser({
      this.leadId, 
      this.userId, 
      this.note,});

  PostAssignUser.fromJson(dynamic json) {
    leadId = json['lead_id'];
    userId = json['user_id[]'];
    note = json['note'];
  }
  String? leadId;
  String? userId;
  String? note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lead_id'] = leadId;
    map['user_id[]'] = userId;
    map['note'] = note;
    return map;
  }

}