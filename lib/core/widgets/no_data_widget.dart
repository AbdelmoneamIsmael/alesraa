import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.caption,
    required this.buttonText,
    required this.onTap,
  });

  final String imagePath;
  final String title;
  final String caption;
  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Spaces.height16),
      height: Spaces.height * .53375,
      child: Column(
        children: [
          Image(
            image: AssetImage(imagePath),
            height: Spaces.height20 * 10,
          ),
          Text(
            title,
            style: AppTextStyle.headerBold().copyWith(fontSize: 24),
          ),
          SizedBox(
            height: Spaces.height16,
          ),
          Text(
            caption,
            textAlign: TextAlign.center,
            style:
                AppTextStyle.textRegular().copyWith(color: AppColors.grey150),
          ),
          SizedBox(
            height: Spaces.height16,
          ),
          SizedBox(
            height: Spaces.height8 * 3,
          ),
          PrimeButtom(text: buttonText, onTap: onTap),
        ],
      ),
    );
  }
}
