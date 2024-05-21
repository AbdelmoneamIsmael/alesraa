// import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class Spaces {
  static late double height;
  static late double width;
  static late BuildContext context;

  static void init(BuildContext mainContext) {
    context = mainContext;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

//width
  static double width5 = width * .01388;
  static double width8 = width * .022222;
  static double width10 = width * .02777;
  static double width16 = width * .0444;
  static double width20 = width * .05555;
  //height
  static double height5 = height * .00625;
  static double height8 = height * .01;
  static double height10 = height * .0125;
  static double height16 = height * .02;
  static double height20 = height * .025;
  static double height24 = height * .03;
  double resizedHeight(double number) {
    return height * (number / 800);
  }

  double resizedWidth(double number) {
    return width * (number / 400);
  }

  double fontSize(double number) {
    return number * (width / 400);
  }
}
