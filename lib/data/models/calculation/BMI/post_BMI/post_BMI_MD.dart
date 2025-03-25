
class PostBmiMd {
  String? score;
  String? category;
  String? comment;

  PostBmiMd({this.score, this.category, this.comment});

  PostBmiMd.fromJson(Map<String, dynamic> json) {
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