import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key,
      this.image,
      required this.text,
      this.backGroundColor = const Color(0xFFF6FFFD),
      this.childImage});
  final Widget? childImage;
  final ImageProvider<Object>? image;
  final String text;
  final Color? backGroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.only(bottom: 10.responsiveHeight),
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border.all(color: AppColors.grey50),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: image != null
                  ? Image(image: image!)
                  : ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                      child: childImage,
                    ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: AppTextStyle.medium14.copyWith(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
