import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_agenda/core/theme/color_constants.dart';

class AppTextStyles {
  AppTextStyles._();

  /// Appbar
  static TextStyle appbarTitle = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle appbarTitleMedium = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  //bottom bar
  static TextStyle bottomBarTitle = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  ///body
  static TextStyle body = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyBold = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodySmall = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  /// Inputs
  static TextStyle inputLabel = GoogleFonts.poppins(
    color: AppColors.labelText,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );
  static TextStyle inputFloatingLabel = GoogleFonts.poppins(
    color: AppColors.labelText,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle inputHint = GoogleFonts.poppins(
    color: AppColors.gray,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle inputError = GoogleFonts.poppins(
    color: AppColors.red,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}

class CustomTextStyles {
  static TextStyle customTextStylePoppins(
      {double fontSize = 12,
      Color color = const Color(0xFF000000),
      FontWeight fontWeight = FontWeight.w400}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
