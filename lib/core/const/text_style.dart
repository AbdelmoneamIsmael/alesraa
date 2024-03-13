import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';

TextStyle headerInIntro(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25);

TextStyle customSmallText(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12);

TextStyle customMediumText(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14);

class AppTextStyle {
  static TextStyle headerBold() => const TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w700,
        fontSize: 32,
      );
  static TextStyle headerRegullar() => const TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w400,
        fontSize: 32,
      );
  static TextStyle headerSemiBold() => const TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w600,
        fontSize: 32,
      );
  static TextStyle textSemiBold() => const TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  static TextStyle textMedium() => const TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  static TextStyle textRegular() => const TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
  static TextStyle captionStyle() => const TextStyle(
        color: AppColors.grey100,
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );
}
