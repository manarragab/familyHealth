class Guests {
  Guests({
    this.fullName,
    this.gender,
    this.phone,
    this.phonecode,
    this.nationality,
  });

  Guests.fromJson(dynamic json) {
    fullName = json['full_name'];
    gender = json['gender'];
    phone = json['phone'];
    phonecode = json['phonecode'];
    nationality = json['nationality'];
  }
  String? fullName;
  String? gender;
  String? phone;
  num? phonecode;
  String? nationality;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = fullName;
    map['gender'] = gender;
    map['phone'] = phone;
    map['phonecode'] = phonecode;
    map['nationality'] = nationality;
    return map;
  }
}
