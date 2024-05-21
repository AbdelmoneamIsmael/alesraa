import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class PrimeButtom extends StatelessWidget {
  const PrimeButtom(
      {super.key,
      required this.text,
      this.backgroundColor = Colors.black,
      this.textColor = AppColor.primaryColor,
      this.height = 60,
      required this.onTap,
      this.width = double.infinity,
      this.widgetNextToText,
      this.textFontSize = 16});
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final void Function()? onTap;
  final double width;
  final Widget? widgetNextToText;
  final double? textFontSize;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12)),
      height: height,
      minWidth: width,
      textColor: textColor,
      color: backgroundColor,
      disabledColor: AppColor.grey100,
      disabledTextColor: AppColor.grey50,
      onPressed: onTap,
      child: widgetNextToText != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,
                    style: AppTextStyle.textSemiBold()
                        .copyWith(fontSize: textFontSize, color: textColor)),
                const SizedBox(width: 5),
                widgetNextToText!,
              ],
            )
          : Text(text,
              style: AppTextStyle.textSemiBold()
                  .copyWith(fontSize: textFontSize, color: textColor)),
    );
  }
}
