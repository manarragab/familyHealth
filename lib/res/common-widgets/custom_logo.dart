import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({required this.height, required this.width, Key? key})
      : super(key: key);
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const Placeholder(),
    );
  }
}
