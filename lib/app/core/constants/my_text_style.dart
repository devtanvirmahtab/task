import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final hintStyle = GoogleFonts.anekBangla(
  fontSize: 14,
  color: AppColor.inputColor,
  fontWeight: FontWeight.w400,
);

TextStyle text12Style({
  Color color = AppColor.black,
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w400,
  bool isWeight600 = false,
  bool isWeight500 = false,
  bool isGrayColor = false,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  bool isHindSiliguri = false,
  double? letterSpacing,
  double? lineHeight,
}) {
  return (isHindSiliguri ? GoogleFonts.hindSiliguri : GoogleFonts.anekBangla)(
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    color: isPrimaryColor
        ? AppColor.primaryColor
        : isWhiteColor
        ? AppColor.white
        : isGrayColor
        ? AppColor.grey
        : color,
    fontWeight: isWeight600
        ? FontWeight.w600
        : isWeight500
        ? FontWeight.w500
        : fontWeight,
    height: lineHeight,
  );
}

TextStyle text14Style({
  Color color = AppColor.black,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w400,
  bool isWeight600 = false,
  bool isWeight500 = false,
  bool isGrayColor = false,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  bool isHindSiliguri = false,
  double? letterSpacing,
  double? lineHeight,
}) {
  return (isHindSiliguri ? GoogleFonts.hindSiliguri : GoogleFonts.anekBangla)(
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    color: isPrimaryColor
        ? AppColor.primaryColor
        : isWhiteColor
        ? AppColor.white
        : isGrayColor
        ? AppColor.grey
        : color,
    fontWeight: isWeight600
        ? FontWeight.w600
        : isWeight500
        ? FontWeight.w500
        : fontWeight,
    height: lineHeight,
  );
}

TextStyle text16Style({
  Color color = AppColor.black,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
  bool isWeight600 = false,
  bool isWeight400 = false,
  bool isGrayColor = false,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  bool isHindSiliguri = false,
  double? letterSpacing,
  double? lineHeight,
}) {
  return (isHindSiliguri ? GoogleFonts.hindSiliguri : GoogleFonts.anekBangla)(
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    color: isPrimaryColor
        ? AppColor.primaryColor
        : isWhiteColor
        ? AppColor.white
        : isGrayColor
        ? AppColor.grey
        : color,
    fontWeight: isWeight600
        ? FontWeight.w600
        : isWeight400
        ? FontWeight.w400
        : fontWeight,
    height: lineHeight,
  );
}

TextStyle text18Style({
  Color color = AppColor.black,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w600,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isGrayColor = false,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  bool isHindSiliguri = false,
  bool isAbhayaLibre = false,
  double? letterSpacing,
  double? lineHeight,
}) {
  return (isAbhayaLibre
      ? GoogleFonts.abhayaLibre
      : isHindSiliguri
      ? GoogleFonts.hindSiliguri
      : GoogleFonts.anekBangla)(
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    color: isPrimaryColor
        ? AppColor.primaryColor
        : isWhiteColor
        ? AppColor.white
        : isGrayColor
        ? AppColor.grey
        : color,
    fontWeight: isWeight400
        ? FontWeight.w400
        : isWeight500
        ? FontWeight.w500
        : fontWeight,
    height: lineHeight,
  );
}

TextStyle text20Style({
  Color color = AppColor.black,
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.w800,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isGrayColor = false,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  bool isHindSiliguri = false,
  double? letterSpacing,
  double? lineHeight,
}) {
  return (isHindSiliguri ? GoogleFonts.hindSiliguri : GoogleFonts.anekBangla)(
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    color: isPrimaryColor
        ? AppColor.primaryColor
        : isWhiteColor
        ? AppColor.white
        : isGrayColor
        ? AppColor.grey
        : color,
    fontWeight: isWeight400
        ? FontWeight.w400
        : isWeight500
        ? FontWeight.w500
        : isWeight600
        ? FontWeight.w600
        : fontWeight,
    height: lineHeight,
  );
}

TextStyle textStyle({
  Color color = AppColor.black,
  required double fontSize,
  FontWeight fontWeight = FontWeight.w600,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight700 = false,
  bool isGrayColor = false,
  bool isWhiteColor = false,
  bool isAbhayaLibre = false,
  bool isPrimaryColor = false,
  bool isHindSiliguri = false,
  double? letterSpacing,
  double? lineHeight,
  List<Shadow>? shadows,
}) {
  return (isAbhayaLibre
      ? GoogleFonts.abhayaLibre
      : isHindSiliguri
      ? GoogleFonts.hindSiliguri
      : GoogleFonts.anekBangla)(
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    color: isPrimaryColor
        ? AppColor.primaryColor
        : isWhiteColor
        ? AppColor.white
        : isGrayColor
        ? AppColor.grey
        : color,
    fontWeight: isWeight400
        ? FontWeight.w400
        : isWeight500
        ? FontWeight.w500
        : isWeight700
        ? FontWeight.w700
        : fontWeight,
    height: lineHeight,
    shadows: shadows,
  );
}
