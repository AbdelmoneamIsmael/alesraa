import 'dart:developer';

import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldSection(
            controller: firstNameController,
            name: 'Full Name',
            isPassword: false,
          ),
          FieldSection(
            controller: emailController,
            name: 'Email',
            keyboardType: TextInputType.emailAddress,
            isPassword: false,
          ),
          FieldSection(
            controller: passwordController,
            name: 'Password',
            isPassword: true,
          ),
          const SizedBox(
            height: 10,
          ),
          PrimeButtom(
              text: 'Create Account',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  log('every thing is good');
                } else {
                  log('misssing');
                }
              }),
          const SizedBox(
            height: 20,
          ),
          PrimeButtom(
            text: 'Create Account With Google  ',
            onTap: () {},
            textColor: AppColor.blackColor,
            backgroundColor: AppColor.primaryColor,
            widgetNextToText: const Image(image: AssetImage(googleLogo)),
          ),
        ],
      ),
    );
  }
}
