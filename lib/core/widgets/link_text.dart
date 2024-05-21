import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/cupertino.dart';

class LinkText extends StatelessWidget {
  const LinkText(
      {super.key, required this.onTap, required this.text, this.height});
  final void Function()? onTap;
  final String text;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Text(
        text,
        style: AppTextStyle.textMedium().copyWith(
          color: AppColor.cyanColor,
          fontSize: 14,
          height: height,
        ),
      ),
    );
  }
}
