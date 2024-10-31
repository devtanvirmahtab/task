import 'package:flutter/material.dart';

class AppColor {
  static const int primaryColorValue = 0xFF009265;
  static const MaterialColor colorPrimarySwatch = MaterialColor(
    primaryColorValue,
    <int, Color>{
      50: Color(0xFFE9F3FA),
      100: Color(0xFFBADBEE),
      200: Color(0xFF99CAE6),
      300: Color(0xFF6BB1DA),
      400: Color(0xFF4EA2D3),
      500: Color(primaryColorValue),
      600: Color(0xFF1F7EB6),
      700: Color(0xFF18638E),
      800: Color(0xFF134C6E),
      900: Color(0xFF0E3A54),
    },
  );
  static const Color primaryColor = Color(primaryColorValue);
  static const Color secondaryColor = Color(0xFF5ACDFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color likeWhite = Color(0xFFF0F0F0);
  static const Color black = Color(0xFF000000);
  static const Color inputColor = Color(0x8052596E);
  static const Color grey = Color(0xff9D99A7);
  static const Color likeGrey = Color(0xffe1e1e1);
  static const Color whiteBorder = Color(0xffE5E7EB);
  static const Color cardItemColor = Color(0xffECF6EC);
  static const Color dividerColor = Color(0xFFE7E7E7);
  static const Color appDividerColor = Color(0xFFCFD5D9);
  static const Color infoColor = Color(0xFF33b5e5);
  static const Color successColor = Color(0xFF00C851);
  static const liteGray = Color(0xFFA1A2A3);
  static const Color errorColor = Color(0xFFff4444);
  static const Color disableColor = Color(0xFFB3B3B3);
  static const Color editTextBGColor = Color(0xFFFBFCFE);
  static const Color editTextBorderColor = Color(0xFFE6E6E6);
  static const Color dropdownEditTextBGColor = Color(0xFFF6FFFC);
  static const Color dropdownItemBGColor = Color(0xFFFBFDFF);
  static const Color mainBG = Color(0xFFEFF1F5);
  static const Color redLight = Color(0xFFFC5453);
  static const Color lightBlack = Color(0xff3E404D);
  static const transparent = Color(0x00bd4efe);

  static const shimmerBaseColor = Color(0xFFD9D9D9);
  static const shimmerHighlightColor = Color(0xFFF6F6F6);
}
