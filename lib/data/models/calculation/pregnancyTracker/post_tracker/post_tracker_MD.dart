class PostTrackerMD {
  String? date;

  PostTrackerMD({this.date});

  PostTrackerMD.fromJson(Map<String, dynamic> json) {
    date = json["date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["date"] = date ;
    return _data;
  }
}

