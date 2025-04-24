
class PostDiabetesMd {
  num? age;
  String? gender;
  bool? highBloodPressure;
  bool? steroidsUsage;
  num? weight;
  num? height;
  double? bmiScore;
  num? familyHistoryOfDiabetes;
  num? smokingHistory;

  PostDiabetesMd({this.age, this.gender, this.highBloodPressure, this.steroidsUsage,this.weight,this.height,
   this.bmiScore, this.familyHistoryOfDiabetes, this.smokingHistory});

  PostDiabetesMd.fromJson(Map<String, dynamic> json) {
    age = json["age"];
    gender = json["gender"];
    highBloodPressure = json["highBloodPressure"];
    steroidsUsage = json["steroidsUsageScore"];
    weight=json["weight"];
    height=json["height"];
   // bmiScore = json["bmiScore"];
    familyHistoryOfDiabetes = json["familyHistoryOfDiabetes"];
    smokingHistory = json["smokingHistory"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["age"] = age ??15;
    _data["gender"] = gender??"male";
    _data["highBloodPressure"] = (highBloodPressure ?? false) ? 1 : 0;
    print("xxxxxxxxxxxxxxxx $highBloodPressure");
    _data["steroidsUsage"] = (steroidsUsage?? false) ? 1 : 0;
    _data["weight"] = weight ?? 50;
    _data["height"] = height ?? 50;
    //_data["bmiScore"] = bmiScore;
    _data["familyHistoryOfDiabetes"] = familyHistoryOfDiabetes ??1;
    _data["smokingHistory"] = smokingHistory ??1;
    return _data;
  }
}