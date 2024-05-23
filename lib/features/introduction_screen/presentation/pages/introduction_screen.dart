import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/strings.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/features/introduction_screen/presentation/widgets/page.dart';
import 'package:flutter/material.dart';

class IntroductionScreens extends StatefulWidget {
  const IntroductionScreens({super.key});

  @override
  State<IntroductionScreens> createState() => _IntroductionScreensState();
}

class _IntroductionScreensState extends State<IntroductionScreens> {
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => IntroPages(
                introPageHeader: introPageHeader[index],
                introPageCaption: introPageCaption[index],
                introPageImage: AssetsImages.introPageImages[index],
                index: index,
                onTap: () {
                  setState(() {
                    index = currentPage + 1;
                    _pageController.jumpToPage(index);
                  });
                },
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              itemCount: introPageCaption.length,
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                  _pageController.viewportFraction;
                });
              },
            ),
          ),
          dotsIndicator(),
        ],
      )),
    );
  }

  Column dotsIndicator() {
    return Column(children: [
      const SizedBox(height: 24),
      Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: DotsIndicator(
          dotsCount: 3,
          position: currentPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            color: Colors.grey,
            activeColor: AppColors.cyanColor,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ),
    ]);
  }
}
