class Driver {
  Driver({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.phoneCode,
    this.image,
  });

  Driver.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    phoneCode = json['phone_code'].toString();
    image = json['image'];
  }
  num? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? phoneCode;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['phone_code'] = phoneCode;
    map['image'] = image;
    return map;
  }
}
