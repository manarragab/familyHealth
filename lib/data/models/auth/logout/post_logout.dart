
class PostLogout {
  String? password;
  String? passwordConfirmation;

  PostLogout({this.password, this.passwordConfirmation});

  PostLogout.fromJson(Map<String, dynamic> json) {
    password = json["password"];
    passwordConfirmation = json["password_confirmation"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["password"] = password;
    data["password_confirmation"] = passwordConfirmation;
    return data;
  }
}