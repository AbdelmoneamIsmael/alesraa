import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border.all(color: AppColor.grey50),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 76 / 60,
              child: Container(
                margin: EdgeInsets.all(Spaces.height10),
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
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: AppTextStyle.textSemiBold().copyWith(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
