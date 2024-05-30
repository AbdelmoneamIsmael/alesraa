import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    this.isIconColored = false,
    this.iconBgColor = Colors.white,
  });
  final String iconPath, title, description;
  final Color iconBgColor;
  final bool? isIconColored;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10.0.responsiveHeight),
        padding: EdgeInsets.all(
          10.0.responsiveHeight,
        ),
        height: Spaces.height * 0.3,
        width: Spaces.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.0),
              ),
              height: 55,
              width: 55,
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                colorFilter: isIconColored!
                    ? null
                    : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                iconPath,
                height: 12.0,
                width: 12.0,
              ),
            ),
            16.verticalSpace,
            Text(
              title,
              style: AppTextStyle.headerBold25.copyWith(
                fontSize: 20.responsiveFontSize,
                letterSpacing: -0.9,
              ),
            ),
            12.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyle.regular14.copyWith(
                  color: AppColors.grey150,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
