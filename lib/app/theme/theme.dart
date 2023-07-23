import 'package:base_project/app/theme/app_collor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.backGround,
    // fontFamily: "Muli",
    appBarTheme: appBarTheme1(),
    textTheme: textMethod(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: AppColor.primary,
    elevation: 0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: AppColor.text,
      fontSize: 18,
    ),
  );
}

AppBarTheme appBarTheme1() {
  return AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.black),
    color: AppColor.primaryLight,
    foregroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}

TextTheme textMethod() {
  return TextTheme(
    bodyLarge: TextStyle(
      color: AppColor.text,
    ),
    bodyMedium: TextStyle(
      color: AppColor.text,
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 40,
      vertical: 20,
    ),
    floatingLabelStyle: TextStyle(color: AppColor.primary),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder(),
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(26),
    borderSide: BorderSide(color: AppColor.text),
    gapPadding: 10,
  );
}
