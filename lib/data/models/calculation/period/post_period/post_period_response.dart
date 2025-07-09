
import 'package:abg/data/remote_data/response_model.dart';

class PostperiodResponse extends ResponseModel<Period?> {
  @override
  Period? data;
  @override
  num? status;
  @override
  String? message;

  PostperiodResponse({this.data, this.status, this.message});

  PostperiodResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Period.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result["data"] = data?.toJson();
    result["status"] = status;
    result["message"] = message;
    return result;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if(currentCycle != null) {
      data["current_cycle"] = currentCycle?.toJson();
    }
    if(futureCycle != null) {
      data["future_cycle"] = futureCycle?.toJson();
    }
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["cycle_number"] = cycleNumber;
    data["period_start"] = periodStart;
    data["period_end"] = periodEnd;
    data["ovulation_date"] = ovulationDate;
    if(fertileWindow != null) {
      data["fertile_window"] = fertileWindow?.toJson();
    }
    data["next_cycle_start"] = nextCycleStart;
    data["days_from_now"] = daysFromNow;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["start"] = start;
    data["end"] = end;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["cycle_day"] = cycleDay;
    data["days_since_last_period"] = daysSinceLastPeriod;
    data["next_period_date"] = nextPeriodDate;
    data["days_until_next_period"] = daysUntilNextPeriod;
    return data;
  }
}