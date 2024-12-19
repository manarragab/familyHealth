import 'package:flutter/material.dart';

class AuthErrorWidget extends StatelessWidget {
  const AuthErrorWidget({this.onTap,Key? key}) : super(key: key);
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    onTap?.call();
    return Container();
  }
}
