import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, this.actions, this.onBackPressed});
  final String title;
  final Widget? actions;
  final void Function()? onBackPressed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Spaces.width16, vertical: Spaces.height * .015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _title(context),
                if (actions != null) actions!,
              ],
            ),
          ),
          _devider()
        ],
      ),
    );
  }

  Row _title(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onBackPressed ??
                () {
                  // Navigator.pop(context);

                  GoRouter.of(context).pop();
                },
            icon: SvgPicture.asset(IconAssets.arrowBackIcon)),
        SizedBox(
          width: Spaces.width * .055,
        ),
        Text(
          title,
          style: AppTextStyle.medium14,
        ),
      ],
    );
  }
}

Container _devider() {
  return Container(
    height: 2,
    color: AppColors.grey50,
  );
}
