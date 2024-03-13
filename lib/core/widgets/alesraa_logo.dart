import 'package:flutter/material.dart';

import '../const/images.dart';

class AlesraaLogo extends StatelessWidget {
  const AlesraaLogo({super.key, this.hight = 92.0, this.width = 80});
  final double hight;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight,
      width: width,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(logoImage), fit: BoxFit.cover),
      ),
    );
  }
}
