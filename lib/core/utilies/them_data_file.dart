import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: AppColors.cyanColor,
    scaffoldBackgroundColor: AppColors.backGroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 5,
        enableFeedback: false,
        selectedIconTheme: IconThemeData(color: AppColors.cyanColor),
        selectedLabelStyle: TextStyle(color: AppColors.blackColor),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedItemColor: AppColors.blackColor,
        unselectedItemColor: Colors.grey),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    ),
  );
}
