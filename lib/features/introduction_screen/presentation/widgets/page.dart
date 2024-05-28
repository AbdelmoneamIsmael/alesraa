import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/strings.dart';

import '../../../../core/routes/routers.dart';
import '../../../../core/widgets/alesraa_logo_with_text.dart';

class IntroPages extends StatefulWidget {
  const IntroPages(
      {super.key,
      required this.introPageHeader,
      required this.introPageCaption,
      required this.introPageImage,
      required this.index,
      required this.onTap});
  final String introPageHeader;
  final String introPageCaption;
  final String introPageImage;
  final int index;
  final void Function()? onTap;

  @override
  State<IntroPages> createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
      child: Column(
        children: [
          Container(
            height: 368,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            child: Column(
              children: [
                _appBar(context),
                pageImage(),
              ],
            ),
          ),
          headerText(context),
          captionText(context),
          buttom(widget.index, context),
        ],
      ),
    );
  }

  Column buttom(int index, BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        index == 2
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: PrimeButtom(
                      text: 'Login',
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacement(PageRoutes.loginScreen);
                      },
                      backgroundColor: AppColors.backGroundColor,
                      textColor: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: PrimeButtom(
                      text: 'Get Started',
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacement(PageRoutes.signUpPage);
                      },
                      widgetNextToText: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            : PrimeButtom(
                text: 'Next',
                onTap: widget.onTap,
              ),
      ],
    );
  }

  Column captionText(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          widget.introPageCaption,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Column headerText(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Text(
          widget.introPageHeader,
          style: AppTextStyle.headerInIntroBold25,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Center pageImage() {
    return Center(
      child: Container(
        height: 240,
        width: 240,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.introPageImage),
          ),
        ),
      ),
    );
  }

  Padding _appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AlesraaLogoWithText(),
          GestureDetector(
            onTap: () => GoRouter.of(context).push(PageRoutes.signUpPage),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                skip,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.cyanColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
