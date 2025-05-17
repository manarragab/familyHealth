
class PostIbsMD {
  String? age;
  bool? recurringAbdominalPain;
  bool? painDurationThreeMonths;
  bool? painRelatedToBowel;
  bool? stoolAppearanceChange;
  bool? newOnsetDiarrhea;
  bool? newOnsetConstipation;
  bool? symptomsPastSixMonths;
  bool? rectalBleeding;
  bool? unintentionalWeightLoss;
  bool? abdominalMass;
  bool? feverMalaiseNightSweats;
  bool? suddenBowelHabitChanges;
  bool? familyHistoryColonCancer;

  PostIbsMD({this.age, this.recurringAbdominalPain, this.painDurationThreeMonths, this.painRelatedToBowel, this.stoolAppearanceChange, this.newOnsetDiarrhea, this.newOnsetConstipation, this.symptomsPastSixMonths, this.rectalBleeding, this.unintentionalWeightLoss, this.abdominalMass, this.feverMalaiseNightSweats, this.suddenBowelHabitChanges, this.familyHistoryColonCancer});

  PostIbsMD.fromJson(Map<String, dynamic> json) {
    age = json["age"];
    recurringAbdominalPain = json["recurring_abdominal_pain"];
    painDurationThreeMonths = json["pain_duration_three_months"];
    painRelatedToBowel = json["pain_related_to_bowel"];
    stoolAppearanceChange = json["stool_appearance_change"];
    newOnsetDiarrhea = json["new_onset_diarrhea"];
    newOnsetConstipation = json["new_onset_constipation"];
    symptomsPastSixMonths = json["symptoms_past_six_months"];
    rectalBleeding = json["rectal_bleeding"];
    unintentionalWeightLoss = json["unintentional_weight_loss"];
    abdominalMass = json["abdominal_mass"];
    feverMalaiseNightSweats = json["fever_malaise_night_sweats"];
    suddenBowelHabitChanges = json["sudden_bowel_habit_changes"];
    familyHistoryColonCancer = json["family_history_colon_cancer"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["age"] = age;
    _data["recurring_abdominal_pain"] = recurringAbdominalPain ;
    _data["pain_duration_three_months"] = painDurationThreeMonths;
    _data["pain_related_to_bowel"] = painRelatedToBowel;
    _data["stool_appearance_change"] = stoolAppearanceChange;
    _data["new_onset_diarrhea"] = newOnsetDiarrhea;
    _data["new_onset_constipation"] = newOnsetConstipation;
    _data["symptoms_past_six_months"] = symptomsPastSixMonths;
    _data["rectal_bleeding"] = rectalBleeding;
    _data["unintentional_weight_loss"] = unintentionalWeightLoss;
    _data["abdominal_mass"] = abdominalMass;
    _data["fever_malaise_night_sweats"] = feverMalaiseNightSweats;
    _data["sudden_bowel_habit_changes"] = suddenBowelHabitChanges;
    _data["family_history_colon_cancer"] = familyHistoryColonCancer;
    return _data;
  }
}