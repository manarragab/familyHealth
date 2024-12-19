import 'package:abg/res/configuration/color.dart';
import 'package:abg/res/configuration/fonts.dart';
import 'package:abg/res/configuration/image/custom_image.dart';
import 'package:flutter/material.dart';

class IconWithTitle extends StatelessWidget {
  const IconWithTitle({
    Key? key,
    required this.onPress,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final void Function()? onPress;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    double containerHeight = 50;
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: containerHeight,
                width: containerHeight,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: CustomColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                alignment: Alignment.center,
                child: CustomImage.asset(
                  icon,
                  fit: BoxFit.contain,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              alignment: Alignment.center,
              child: Text(
                text,
                style: TFonts.floatActionButtonStyle(),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}