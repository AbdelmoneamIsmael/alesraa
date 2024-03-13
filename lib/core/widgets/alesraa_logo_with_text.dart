import 'package:flutter/material.dart';

import 'package:e_commerce/core/const/images.dart';

class AlesraaLogoWithText extends StatelessWidget {
  const AlesraaLogoWithText(
      {super.key, this.hight = 60.0, this.width = 50, this.fontsize = 20});
  final double hight;
  final double width;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: hight,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(logoImage), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Alesraa',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: fontsize),
        ),
      ],
    );
  }
}
