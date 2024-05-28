import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/widgets/alesraa_logo_with_text.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/features/sign_up_login/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AlesraaLogoWithText(),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  'Login',
                  style: AppTextStyle.headerBold32,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Don\'t have any  Account !!?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .pushReplacement(PageRoutes.signUpPage);
                        },
                        child: Text(
                          ' SignUp ? ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.cyanColor),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                LoginForm(),
                const SizedBox(
                  height: 131,
                ),
                const Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text('By login , you agree to our '),
                      Text(
                        'Privacy Policy ',
                        style: TextStyle(color: Color(0xff1F8BDA)),
                      ),
                      Text('and  '),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(color: Color(0xff1F8BDA)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
