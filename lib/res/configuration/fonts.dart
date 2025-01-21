import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

/*
The advantage here is that any change 
that occurs to any common characteristic 
will affect the rest accordingly

 */

/*
Text("xxx",style:
TFonts.segoeUi(
  color:TColors.kDarkblue
  fontSize:TFontSizes.13 ,
    fontWeight: TFontWights.semibold,
))
 */

class TFonts {
  static get titleBoard => inter(
      color: CustomColors.black, fontWeight: FontWeight.w700, fontSize: 24);

  static get bodyBoard => inter(
        color: CustomColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5,
      );

  static cardBody(
          {Color? color,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 12}) =>
      inter(
          color: color ?? CustomColors.textDark,
          fontWeight: fontWeight,
          fontSize: fontSize);

  static orderCardBody(
          {Color? color,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 12}) =>
      inter(
          color: color ?? CustomColors.textDark,
          fontWeight: fontWeight,
          fontSize: fontSize);

  static floatActionButtonStyle(
          {Color? color,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 10}) =>
      inter(
          color: color ?? CustomColors.textDark,
          fontWeight: fontWeight,
          fontSize: fontSize);

  static appBarTitle(
          {Color? color,
          FontWeight fontWeight = TFontWights.bold,
          double fontSize = 22}) =>
      inter(
          color: color ?? CustomColors.black,
          fontWeight: fontWeight,
          fontSize: fontSize);

  static TextStyle get textBigTitle => inter(
      color: CustomColors.textDark,
      fontWeight: TFontWights.bold,
      fontSize: TFontSizes.f16);

  static TextStyle get mainButton =>
      inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  /// title
  static textTitleStyle(
          {Color? color, FontWeight? fontWeight, double fontSize = 18}) =>
      inter(
          color: color ?? CustomColors.black,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontSize: fontSize);

  static get textTitleStylePrimary => inter(
      color: CustomColors.black,
      fontWeight: FontWeight.w600,
      fontSize: TFontSizes.f18);

  static get textAppBarTitleStyle => inter(
      color: CustomColors.white,
      fontWeight: TFontWights.bold,
      fontSize: TFontSizes.f22);

  static textTitleWhiteStyle(
          {Color color = CustomColors.white,
          FontWeight fontWeight = TFontWights.regular,
          double fontSize = 18}) =>
      inter(color: color, fontWeight: fontWeight, fontSize: fontSize);

  /// body
  static get textBodyWhiteStyle => inter(
      color: CustomColors.white,
      fontWeight: TFontWights.regular,
      fontSize: TFontSizes.f14);

  static get textBodyStyle => inter(
      color: CustomColors.green,
      fontWeight: FontWeight.w600,
      fontSize: TFontSizes.f12);

  static get textBodyStyleDark => inter(
      color: CustomColors.textDark,
      fontWeight: TFontWights.regular,
      fontSize: TFontSizes.f16);

  static get textAppBarTabsStyle => inter(
      color: CustomColors.primary,
      fontWeight: TFontWights.bold,
      fontSize: TFontSizes.f18);

  static get buttonStyleWhite => inter(
      color: CustomColors.white,
      fontWeight: TFontWights.bold,
      fontSize: TFontSizes.f16);

  static TextStyle segoeUi({
    Color? color,
    double? fontSize,
    // FontsFamilies? fontsFamilyType,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.inter(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle inter({
    Color color = Colors.black,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.almarai(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );
  }
}

const String fontFamily = "Almarai";
const String fontFamilyArial = "Arial";
const String fontFamilyDigital = "Digital";

class TFontSizes {
  static const double f6 = 6;
  static const double f8 = 8;
  static const double f10 = 10;
  static const double f12 = 12;
  static const double f13 = 13;
  static const double f14 = 14;
  static const double f16 = 16;
  static const double f18 = 18;
  static const double f20 = 20;
  static const double f22 = 22;
  static const double f26 = 26;
}

class TFontWights {
  static const FontWeight light = FontWeight.w200;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w600;
  static const FontWeight extraBold = FontWeight.bold;
}
