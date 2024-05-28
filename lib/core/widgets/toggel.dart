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
        disabledTextStyle: AppTextStyle.medium12.copyWith(
          color: Colors.white,
        ),
        enabledTextStyle: AppTextStyle.medium12.copyWith(
          color: Colors.white,
        ),
        enabledText: 'New',
        disabledText: 'New',
        disabledTrackColor: AppColors.grey150,
        enabledTrackColor: AppColors.cyanColor,
        type: GFToggleType.ios,
        onChanged: onChanged,
        value: false,
      ),
    );
  }
}
