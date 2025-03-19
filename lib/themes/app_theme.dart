import 'package:flutter/material.dart';
import 'package:mediasquest/themes/app_color.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColor.primaryColor,
  scaffoldBackgroundColor: AppColor.primaryColor,
  dialogBackgroundColor: AppColor.secondaryColor,
  disabledColor: AppColor.disabledColor,

  textTheme: TextTheme(
    displayLarge: TextStyle(color: AppColor.textColor),
    displayMedium: TextStyle(color: AppColor.textColor),
    displaySmall: TextStyle(color: AppColor.textColor),
    headlineLarge: TextStyle(color: AppColor.textColor),
    headlineMedium: TextStyle(color: AppColor.textColor),
    headlineSmall: TextStyle(color: AppColor.textColor),
    titleLarge: TextStyle(color: AppColor.textColor),
    titleMedium: TextStyle(color: AppColor.textColor),
    titleSmall: TextStyle(color: AppColor.textColor),
    bodyLarge: TextStyle(color: AppColor.textColor),
    bodyMedium: TextStyle(color: AppColor.textColor),
    bodySmall: TextStyle(color: AppColor.textColor),
    labelLarge: TextStyle(color: AppColor.textColor),
    labelMedium: TextStyle(color: AppColor.textColor),
    labelSmall: TextStyle(color: AppColor.textColor),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.secondaryColor,
    iconTheme: IconThemeData(color: AppColor.textColor, size: 20),
    titleTextStyle: TextStyle(color: AppColor.textColor, fontSize: 18),
    scrolledUnderElevation: 0
  ),
);
