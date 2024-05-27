import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/features/home_screen/presentation/widgets/offer_page.dart';
import 'package:flutter/material.dart';

class HotOfferPannel extends StatelessWidget {
  const HotOfferPannel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.responsiveHeight,
      child: Stack(
        children: [
          SizedBox(
            height: 180.responsiveHeight,
            width: double.infinity,
            child: PageView.builder(
              itemBuilder: (context, index) => OffersItems(index: index),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _customdots(),
          ),
        ],
      ),
    );
  }

  Container _customdots() {
    return Container(
      height: 24,
      width: 60,
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: DotsIndicator(
        dotsCount: 4,
        position: 0,
        decorator: DotsDecorator(
          spacing: const EdgeInsets.symmetric(horizontal: 2),
          size: const Size.square(9.0),
          color: Colors.grey,
          activeColor: AppColors.cyanColor,
          activeSize: const Size(10.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }
}
