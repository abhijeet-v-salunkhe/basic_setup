import 'package:flutter/material.dart';
import 'package:basic_setup/core/common/custom_fonts/font_family.dart';

class CustomTextStyle {
  static TextTheme get textTheme => ThemeData.light().textTheme;

  //Regular font styles
  static TextStyle regular({
    required double fontSize,
    Color color = Colors.black,
  }) => textTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    fontFamily: regularFontFamily,
    color: color,
  );

  //Medium font styles
  static TextStyle medium({
    required double fontSize,
    Color color = Colors.black,
  }) => textTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    fontFamily: mediumFontFamily,
    color: color,
  );

  //Semi-Bold font styles
  static TextStyle semiBold({
    required double fontSize,
    Color color = Colors.black,
  }) => textTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    fontFamily: semiBoldFontFamily,
    color: color,
  );

  //Bold font styles
  static TextStyle bold({
    required double fontSize,
    Color color = Colors.black,
  }) => textTheme.bodyMedium!.copyWith(
    fontSize: fontSize,
    fontFamily: boldFontFamily,
    color: color,
  );
}
