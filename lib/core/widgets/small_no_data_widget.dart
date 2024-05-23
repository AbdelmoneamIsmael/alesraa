import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.color,
    this.iconBgColor = Colors.white,
  });
  final String iconPath, title, description;
  final Color color, iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: Spaces.height * 0.3,
        width: Spaces.width * 0.9,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              height: 55,
              width: 55,
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                iconPath,
                height: 12.0,
                width: 12.0,
              ),
            ),
            16.verticalSpace,
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                letterSpacing: -0.9,
              ),
            ),
            12.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
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
