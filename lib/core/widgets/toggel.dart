import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';

import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';

class CustomToggel extends StatelessWidget {
  const CustomToggel({super.key, required this.onChanged});
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: GFToggle(
        disabledTextStyle: AppTextStyle.textMedium().copyWith(
          fontSize: 12,
          color: Colors.white,
        ),
        enabledTextStyle: AppTextStyle.textMedium().copyWith(
          fontSize: 12,
          color: Colors.white,
        ),
        enabledText: 'New',
        disabledText: 'New',
        disabledTrackColor: AppColor.grey150,
        enabledTrackColor: AppColor.cyanColor,
        type: GFToggleType.ios,
        onChanged: onChanged,
        value: false,
      ),
    );
  }
}
