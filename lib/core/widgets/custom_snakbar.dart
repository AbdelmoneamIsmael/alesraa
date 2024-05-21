import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UIHelper {
  static void showSnakBar({
    required BuildContext context,
    String? title,
    required String message,
    required String iconPath,
  }) {
    AnimatedSnackBar(
        animationCurve: Curves.easeOutCirc,
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(seconds: 1),
        builder: (context) => Container(
              padding: const EdgeInsets.all(13),
              decoration: const BoxDecoration(
                  color: AppColor.grey50,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Row(
                children: [
                  SvgPicture.asset(iconPath),
                  const SizedBox(width: 6),
                  Text(
                    message,
                    style: AppTextStyle.textSemiBold().copyWith(fontSize: 12),
                  ),
                ],
              ),
            )).show(
      context,
    );
  }
}
