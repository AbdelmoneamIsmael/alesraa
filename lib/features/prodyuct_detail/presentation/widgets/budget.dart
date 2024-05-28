import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/material.dart';

class Budget extends StatelessWidget {
  const Budget({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        margin: EdgeInsets.all(Spaces.height5),
        padding: EdgeInsets.all(Spaces.height8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(Spaces.height10)),
        ),
        child: Text(
          text,
          style: AppTextStyle.medium
              .copyWith(fontSize: Spaces.height10, color: Colors.white),
        ),
      ),
    );
  }
}
