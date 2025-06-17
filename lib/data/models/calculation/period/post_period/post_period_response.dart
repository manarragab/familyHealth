
import 'package:abg/data/remote_data/response_model.dart';

class PostperiodResponse extends ResponseModel<Period?> {
  Period? data;
  num? status;
  String? message;

  PostperiodResponse({this.data, this.status, this.message});

  PostperiodResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Period.fromJson(json["data"]);
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

class Period {
  CurrentCycle? currentCycle;
  FutureCycle? futureCycle;

  Period({this.currentCycle, this.futureCycle});

  Period.fromJson(Map<String, dynamic> json) {
    currentCycle = json["current_cycle"] == null ? null : CurrentCycle.fromJson(json["current_cycle"]);
    futureCycle = json["future_cycle"] == null ? null : FutureCycle.fromJson(json["future_cycle"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(currentCycle != null) {
      _data["current_cycle"] = currentCycle?.toJson();
    }
    if(futureCycle != null) {
      _data["future_cycle"] = futureCycle?.toJson();
    }
    return _data;
  }
}

class FutureCycle {
  int? cycleNumber;
  String? periodStart;
  String? periodEnd;
  String? ovulationDate;
  FertileWindow? fertileWindow;
  String? nextCycleStart;
  int? daysFromNow;

  FutureCycle({this.cycleNumber, this.periodStart, this.periodEnd, this.ovulationDate, this.fertileWindow, this.nextCycleStart, this.daysFromNow});

  FutureCycle.fromJson(Map<String, dynamic> json) {
    cycleNumber = json["cycle_number"];
    periodStart = json["period_start"];
    periodEnd = json["period_end"];
    ovulationDate = json["ovulation_date"];
    fertileWindow = json["fertile_window"] == null ? null : FertileWindow.fromJson(json["fertile_window"]);
    nextCycleStart = json["next_cycle_start"];
    daysFromNow = json["days_from_now"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cycle_number"] = cycleNumber;
    _data["period_start"] = periodStart;
    _data["period_end"] = periodEnd;
    _data["ovulation_date"] = ovulationDate;
    if(fertileWindow != null) {
      _data["fertile_window"] = fertileWindow?.toJson();
    }
    _data["next_cycle_start"] = nextCycleStart;
    _data["days_from_now"] = daysFromNow;
    return _data;
  }
}

class FertileWindow {
  String? start;
  String? end;

  FertileWindow({this.start, this.end});

  FertileWindow.fromJson(Map<String, dynamic> json) {
    start = json["start"];
    end = json["end"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["start"] = start;
    _data["end"] = end;
    return _data;
  }
}

class CurrentCycle {
  int? cycleDay;
  int? daysSinceLastPeriod;
  String? nextPeriodDate;
  int? daysUntilNextPeriod;

  CurrentCycle({this.cycleDay, this.daysSinceLastPeriod, this.nextPeriodDate, this.daysUntilNextPeriod});

  CurrentCycle.fromJson(Map<String, dynamic> json) {
    cycleDay = json["cycle_day"];
    daysSinceLastPeriod = json["days_since_last_period"];
    nextPeriodDate = json["next_period_date"];
    daysUntilNextPeriod = json["days_until_next_period"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cycle_day"] = cycleDay;
    _data["days_since_last_period"] = daysSinceLastPeriod;
    _data["next_period_date"] = nextPeriodDate;
    _data["days_until_next_period"] = daysUntilNextPeriod;
    return _data;
  }
}