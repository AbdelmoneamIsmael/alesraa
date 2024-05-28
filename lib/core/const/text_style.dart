import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/values.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();
  //bold
  static TextStyle headerInIntroBold25 = TextStyle(
    color: AppColors.blackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 25.responsiveFontSize,
  );
  static TextStyle headerBold32 = TextStyle(
    color: AppColors.blackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 32.responsiveFontSize,
  );
  static TextStyle headerBold25 = TextStyle(
    color: AppColors.blackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 25.responsiveFontSize,
  );
  //meuim
  static TextStyle headermedium32 = TextStyle(
    color: AppColors.blackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 32.responsiveFontSize,
  );
  static TextStyle medium16 = TextStyle(
    color: AppColors.blackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 32.responsiveFontSize,
  );

  static TextStyle textMedium14 = TextStyle(
    color: AppColors.blackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 14.responsiveFontSize,
  );
  static TextStyle textMedium = const TextStyle(
    color: AppColors.blackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textMedium12 = TextStyle(
    color: AppColors.blackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 12.responsiveFontSize,
  );
  //regullar
  static TextStyle headerRegullar32 = TextStyle(
    color: AppColors.blackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 32.responsiveFontSize,
  );

  static TextStyle textRegular14 = TextStyle(
    color: AppColors.blackColor,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.responsiveFontSize,
  );
  static TextStyle captionStyle12 = TextStyle(
    color: AppColors.grey100,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.responsiveFontSize,
  );
  static TextStyle textRegulargrey14 = TextStyle(
    color: AppColors.grey150,
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.responsiveFontSize,
  );
}
