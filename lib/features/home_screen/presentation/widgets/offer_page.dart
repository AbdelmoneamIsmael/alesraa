import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/material.dart';

class OffersItems extends StatelessWidget {
  const OffersItems({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),
        Align(
          alignment: Alignment.bottomLeft,
          child: offerDetails(context),
        ),
      ],
    );
  }

  Padding offerDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 10),
      child: SizedBox(
        height: 75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            offerPannel(context),
            const SizedBox(
              height: 8,
            ),
            Text(
              'On Televisions',
              style: customMediumText(context)
                  .copyWith(color: AppColor.primaryColor),
            ),
            Text(
              'Exclusive Sales',
              style:
                  headerInIntro(context).copyWith(color: AppColor.primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Container backgroundImage() {
    return Container(
      // width: double.infinity,
      decoration: const BoxDecoration(
        // color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(24)),
        image: DecorationImage(image: AssetImage(samsungTV), fit: BoxFit.cover),
      ),
    );
  }

  Container offerPannel(BuildContext context) {
    return Container(
      height: 25,
      width: 65,
      decoration: BoxDecoration(
        color: AppColor.blackColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          '30 % Off',
          style: customSmallText(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
