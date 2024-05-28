import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldSection extends StatelessWidget {
  const FieldSection({
    super.key,
    required this.controller,
    required this.name,
    required this.isPassword,
    this.keyboardType = TextInputType.text,
    this.hint,
    this.onChange,
    this.onTap,
    this.maxLines = 1,
    this.isRequered = true,
    this.inputFormatters,
  });
  final String name;
  final int? maxLines;
  final String? hint;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isRequered;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              name,
              style: AppTextStyle.medium,
            ),
            isRequered!
                ? Text(
                    ' *',
                    style:
                        AppTextStyle.medium.copyWith(color: AppColors.redColor),
                  )
                : const SizedBox(),
          ],
        ),
        SizedBox(
          height: Spaces.height8,
        ),
        CustomTextForm(
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          onChange: onChange,
          onTap: onTap,
          maxLines: maxLines,
          hintText: hint ?? name,
          textEditingController: controller,
          isPassword: isPassword,
          validator: isRequered!
              ? (value) {
                  if (value!.isEmpty) {
                    return 'you must fill $name field';
                  }
                  return null;
                }
              : null,
        ),
        SizedBox(
          height: Spaces.height16,
        ),
      ],
    );
  }
}
