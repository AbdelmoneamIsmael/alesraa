import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {super.key,
      required this.hintText,
      this.isPassword = false,
      this.textEditingController,
      this.validator,
      this.keyboardType,
      this.suffixIcon,
      this.preIcon,
      this.onChange,
      this.onTap,
      this.maxLines = 1});
  final String hintText;
  final int? maxLines;
  final bool isPassword;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? preIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      onChanged: onChange,
      onTap: onTap,
      maxLines: maxLines,
      keyboardType: keyboardType,
      // keyboardAppearance: TextInputType.text==keyboardType?Brightness.light:Brightness.,
      keyboardAppearance: Brightness.light,
      validator: validator,
      style: Theme.of(context).textTheme.bodySmall,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        focusColor: AppColor.cyanColor,
        suffixIcon: suffixIcon,
        prefixIcon: preIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColor.cyanColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColor.grey50),
        ),
      ),
    );
  }
}
