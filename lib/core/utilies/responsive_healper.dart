import 'package:e_commerce/core/const/spaces.dart';
import 'package:flutter/widgets.dart';

extension ResponsiveHelper on num {
  double get responsiveHeight =>
      MediaQuery.of(Spaces.context).size.height * this / 926;
  double get responsiveWidth =>
      MediaQuery.of(Spaces.context).size.width * this / 390;
  double get responsiveFontSize =>
      this * MediaQuery.of(Spaces.context).size.width / 390;
  SizedBox get virticalSpace => SizedBox(height: responsiveHeight);
  SizedBox get horizontalSpace => SizedBox(height: responsiveWidth);
}
