import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      this.maxLines = 1,
      this.inputFormatters});
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
  final List<TextInputFormatter>? inputFormatters;
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
      inputFormatters: inputFormatters,
      validator: validator,
      style: Theme.of(context).textTheme.bodySmall,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        focusColor: AppColors.cyanColor,
        suffixIcon: suffixIcon,
        prefixIcon: preIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.cyanColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey50),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
      ),
    );
  }
}
