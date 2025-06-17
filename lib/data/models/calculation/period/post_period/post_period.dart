
class Postperiod {
  String? startDate;
  int? periodDuration;

  Postperiod({this.startDate, this.periodDuration});

  Postperiod.fromJson(Map<String, dynamic> json) {
    startDate = json["start_date"];
    periodDuration = json["period_duration"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["start_date"] = startDate;
    print("start_date: $startDate");
    _data["period_duration"] = periodDuration;
    print("period_duration: $periodDuration");
    return _data;
  }
}