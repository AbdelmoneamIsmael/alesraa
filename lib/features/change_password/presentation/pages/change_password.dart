import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeOldPassword extends StatefulWidget {
  const ChangeOldPassword({super.key});

  @override
  State<ChangeOldPassword> createState() => _ChangeOldPasswordState();
}

class _ChangeOldPasswordState extends State<ChangeOldPassword> {
  final TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _appbar(),
          Padding(
            padding: EdgeInsets.all(Spaces.height16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Old Password',
                  style: AppTextStyle.headerBold().copyWith(fontSize: 24),
                ),
                Text(
                  'Enter old password to change the password.',
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
                        controller: controller,
                        name: 'PassWord',
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
                              GoRouter.of(context).push(PageRoutes.changePass);
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
              '01/',
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
