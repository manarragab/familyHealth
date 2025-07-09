
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["age"] = age;
    data["recurring_abdominal_pain"] = recurringAbdominalPain ;
    data["pain_duration_three_months"] = painDurationThreeMonths;
    data["pain_related_to_bowel"] = painRelatedToBowel;
    data["stool_appearance_change"] = stoolAppearanceChange;
    data["new_onset_diarrhea"] = newOnsetDiarrhea;
    data["new_onset_constipation"] = newOnsetConstipation;
    data["symptoms_past_six_months"] = symptomsPastSixMonths;
    data["rectal_bleeding"] = rectalBleeding;
    data["unintentional_weight_loss"] = unintentionalWeightLoss;
    data["abdominal_mass"] = abdominalMass;
    data["fever_malaise_night_sweats"] = feverMalaiseNightSweats;
    data["sudden_bowel_habit_changes"] = suddenBowelHabitChanges;
    data["family_history_colon_cancer"] = familyHistoryColonCancer;
    return data;
  }
}