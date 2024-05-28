import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/material.dart';

class TitleTile extends StatelessWidget {
  const TitleTile({super.key, required this.title, this.fontSize = 12});
  final String title;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Spaces.height16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.textMedium.copyWith(
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
