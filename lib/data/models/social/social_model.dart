import 'package:abg/features/auth/domain/controller/authenticate_methods.dart';

class SocialModel {
  late String uid;
  late SocialType socialType;
  String? name;
  String? image;
  String? email;
  String? phone;

  SocialModel(
      {required this.uid,
      this.name,
      this.image,
      this.email,
      this.phone,
      required this.socialType});
}
