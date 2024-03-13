import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistorySearchText extends StatelessWidget {
  const HistorySearchText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Spaces.height * .0625,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.grey50),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          // bottom: screen.height5,
          left: Spaces.width16,
          right: Spaces.width16,
          top: Spaces.height20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppTextStyle.textMedium(),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(IconAssets.sendIcon),
            )
          ],
        ),
      ),
    );
  }
}
