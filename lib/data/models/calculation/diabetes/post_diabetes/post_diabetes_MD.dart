
class PostDiabetesMd {
  num? age;
  String? gender;
  bool? highBloodPressure;
  bool? steroidsUsage;
  num? weight;
  num? height;
  num? bmiScore;
  num? familyHistoryOfDiabetes;
  num? smokingHistory;

  PostDiabetesMd({this.age=10, this.gender, this.highBloodPressure, this.steroidsUsage,this.weight,this.height,
   this.bmiScore, this.familyHistoryOfDiabetes, this.smokingHistory});

  PostDiabetesMd.fromJson(Map<String, dynamic> json) {
    age = json["age"];
    gender = json["gender"];
    highBloodPressure = json["high_blood_pressure"];
    steroidsUsage = json["steroids_usage"];
    weight=json["weight"];
    height=json["height"];
   // bmiScore = json["bmiScore"];
    familyHistoryOfDiabetes = json["family_history_of_diabetes"];
    smokingHistory = json["smoking_history"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["age"] = age ;
    _data["gender"] = gender;
    _data["high_blood_pressure"] = (highBloodPressure ?? false) ? 1 : 0;
    print("xxxxxxxxxxxxxxxx $highBloodPressure");
    _data["steroids_usage"] = (steroidsUsage?? false) ? 1 : 0;
    _data["weight"] = weight ?? 50;
    _data["height"] = height ?? 50;
    //_data["bmiScore"] = bmiScore;
    _data["family_history_of_diabetes"] = familyHistoryOfDiabetes ??1;
    _data["smoking_history"] = smokingHistory ??1;
    return _data;
  }
}