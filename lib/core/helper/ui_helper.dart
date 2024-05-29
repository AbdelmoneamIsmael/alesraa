import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UiHelper {
  static void showSnakBar({
    String? title,
    required BuildContext context,
    required String message,
    required String iconPath,
  }) {
    AnimatedSnackBar(
      animationCurve: Curves.easeOutCirc,
      duration: const Duration(seconds: 4),
      animationDuration: const Duration(seconds: 1),
      builder: (context) => Container(
        padding: const EdgeInsets.all(13),
        decoration: const BoxDecoration(
            color: AppColors.grey50,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(width: 6),
            Text(
              message,
              style: AppTextStyle.medium12,
            ),
          ],
        ),
      ),
    ).show(
      context,
    );
  }
}

class PrinterHelper {
  final String title;
  PrinterHelper(this.title) {
    log(title);
  }
}
