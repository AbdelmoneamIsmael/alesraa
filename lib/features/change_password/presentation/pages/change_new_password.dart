import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeNewPassword extends StatefulWidget {
  const ChangeNewPassword({super.key});

  @override
  State<ChangeNewPassword> createState() => _ChangeNewPasswordState();
}

class _ChangeNewPasswordState extends State<ChangeNewPassword> {
  final TextEditingController controllerOne = TextEditingController();
  final TextEditingController controllerTwo = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: ListView(
        children: [
          _appbar(),
          Padding(
            padding: EdgeInsets.all(Spaces.height16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Password',
                  style: AppTextStyle.headerBold().copyWith(fontSize: 24),
                ),
                Text(
                  'Enter your new password and remember it.',
                  style: AppTextStyle.textRegular().copyWith(
                      fontSize: 14, color: AppColor.grey150, height: 2),
                ),
                SizedBox(
                  height: Spaces.height16,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      FieldSection(
                        controller: controllerOne,
                        name: 'PassWord',
                        hint: 'Enter your password',
                        isPassword: true,
                      ),
                      FieldSection(
                        controller: controllerTwo,
                        name: 'Confirm Password ',
                        hint: 'Enter your password',
                        isPassword: true,
                      ),
                      SizedBox(
                        height: Spaces.height10,
                      ),
                      PrimeButtom(
                          text: 'Continue',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              if (controllerOne.text == controllerTwo.text) {
                                GoRouter.of(context).pop();
                                GoRouter.of(context).pop();
                              } else {
                                UiHelper.showSnakBar(
                                    context: context,
                                    iconPath: IconAssets.errorSnakIcon,
                                    message:
                                        'They are not the same please check it again  ');
                              }
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SafeArea _appbar() {
    return SafeArea(
      child: CustomAppBar(
        title: 'Change Password',
        actions: Row(
          children: [
            Text(
              '02/',
              style: AppTextStyle.textMedium(),
            ),
            Text(
              '02',
              style:
                  AppTextStyle.textMedium().copyWith(color: AppColor.grey100),
            ),
          ],
        ),
      ),
    );
  }
}
