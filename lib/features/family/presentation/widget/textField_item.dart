import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TextfieldItem extends StatelessWidget {
  final String hint;
  final String? icon;
  final VoidCallback? tap;
  final double? padding;
  const TextfieldItem(
      {super.key, required this.hint, this.icon, this.tap, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.lightgrey3,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: icon != null
              ? Padding(
                  padding: EdgeInsets.all(padding ?? 12.7),
                  child: GestureDetector(
                      onTap: tap, child: SvgPicture.asset(icon!)),
                )
              : null,
          isDense: true,
          hintText: hint,
          hintStyle: GoogleFonts.almarai(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: CustomColors.lighttblue,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
