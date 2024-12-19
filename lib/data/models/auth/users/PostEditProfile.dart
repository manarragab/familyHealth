/// first_name : "Saw"

class PostEditProfile {
  PostEditProfile({
    this.firstName,
    this.lastName,
  });

  PostEditProfile.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['lastName'];
  }

  String? firstName, lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    return map;
  }
}
