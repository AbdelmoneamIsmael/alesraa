import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: AppColor.cyanColor,
    scaffoldBackgroundColor: AppColor.backGroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0,
        enableFeedback: false,
        selectedIconTheme: IconThemeData(color: AppColor.cyanColor),
        selectedLabelStyle: TextStyle(color: AppColor.blackColor),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedItemColor: AppColor.blackColor,
        unselectedItemColor: Colors.grey),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColor.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: AppColor.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: AppColor.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    ),
  );
}
