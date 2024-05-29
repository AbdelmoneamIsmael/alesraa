import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/widgets/alesraa_logo_with_text.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/features/sign_up_login/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:e_commerce/core/const/text_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AlesraaLogoWithText(),
                const SizedBox(height: 26),
                Text(
                  'Sign Up',
                  style: AppTextStyle.headerBold32,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Already have an account? ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacement(Routes.loginScreen);
                      },
                      child: Text(
                        'Login !',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.cyanColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
