// dot_item
import 'package:flutter/material.dart';

import '../../../../../res/configuration/color.dart';

class DotItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Color? selectedColor;
  final Color? unSelectedColor;

  const DotItem({
    Key? key,
    required this.currentIndex,
    required this.index,
    this.selectedColor,
    this.unSelectedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool selected = index == currentIndex;
    double height = 8;
    return selected
        ? Container(
            height: height - 2,
            width: height * 2,
            decoration: BoxDecoration(
                color: selectedColor ?? CustomColors.secondary,
                borderRadius: BorderRadius.circular(height)),
          )
        : CircleAvatar(
            radius: height / 2,
            backgroundColor: unSelectedColor ?? CustomColors.lightGrey,
          );
  }
}
