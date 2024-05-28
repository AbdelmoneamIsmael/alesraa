import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/material.dart';

class TypeItem extends StatelessWidget {
  const TypeItem({
    super.key,
    this.image,
    required this.text,
    this.backGroundcolor = Colors.white,
    this.childImage,
  });
  final Color? backGroundcolor;

  final ImageProvider<Object>? image;
  final String text;
  final Widget? childImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backGroundcolor,
        borderRadius: BorderRadius.all(
          Radius.circular(Spaces.height24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(Spaces.height24),
              ),
              child: childImage ??
                  Image(
                    height: Spaces.height * .15,
                    width: 160,
                    image: image!,
                    fit: BoxFit.cover,
                  ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: Spaces.width10,
              ),
              SizedBox(
                width: Spaces.width * .388,
                child: Text(
                  text,
                  style: AppTextStyle.textMedium
                      .copyWith(overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
