import 'package:flutter/cupertino.dart';

class AppColors {
  static Color primaryColor = const Color(0xFF000000);
  static Color backgroundColor = const Color(0xFF222222);
  static Color textColorFFFFFF = const Color(0xFFFFFFFF);
  static Color textColorE8E8E8 = const Color(0xFFE8E8E8);
  static Color cardLightColor = const Color(0xFF555555);
  static Color borderColor = const Color(0xFF8CA9F3);
  static Color textColor = const Color(0xFF222222);
  static Color subTextColor = const Color(0xFF4E4E4E);
  static Color hintColor = const Color(0xFF999999);
  static Color greyColor = const Color(0xFF6B6B6B);
  static Color dividerColor = const Color(0xFFBABABA);
  static Color shadowColor = const Color(0xFF2B2A2A);
  static Color bottomBarColor = const Color(0xFF0445E5);
  static Color redColorEB5757 = const Color(0xFFEB5757);
  static Color fillColor = Color(0xFF0445E5).withOpacity(0.15);

  static BoxShadow shadow = BoxShadow(
    blurRadius: 4,
    spreadRadius: 0,
    color: shadowColor,
    offset: const Offset(0, 2),
  );
}
