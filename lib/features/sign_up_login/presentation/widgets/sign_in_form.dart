import 'dart:developer';

import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/text_field_section.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          FieldSection(
            controller: emailController,
            name: 'Email',
            isPassword: false,
          ),
          FieldSection(
            controller: passwordController,
            name: 'Password',
            isPassword: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forget your Password ?.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.cyanColor),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          PrimeButtom(
              text: 'Login',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  GoRouter.of(context).pushReplacement(PageRoutes.mainScreen);
                } else {
                  log('some Errors');
                }
              }),
          const SizedBox(
            height: 20,
          ),
          PrimeButtom(
            backgroundColor: AppColors.primaryColor,
            textColor: AppColors.blackColor,
            text: 'Login With Google',
            onTap: () {},
            widgetNextToText: const Image(
              image: AssetImage(googleLogo),
            ),
          ),
        ],
      ),
    );
  }
}
