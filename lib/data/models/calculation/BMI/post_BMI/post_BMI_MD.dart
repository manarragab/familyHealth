
class PostBmiMd {
  int? weight;
  int? height;
  bool? add_to_profile;
  
  PostBmiMd({this.add_to_profile,this.height ,this.weight});

  PostBmiMd.fromJson(Map<String, dynamic> json) {

    weight=json["weight"];
    height=json["height"];
    add_to_profile=json["add_to_profile"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    _data["weight"]=weight ??50;
    _data["height"]=height ??50;
    _data["add_to_profile"]=add_to_profile ==true? "1" : "0";
    return _data;
  }
}