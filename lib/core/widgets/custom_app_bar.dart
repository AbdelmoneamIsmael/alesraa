import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/const/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomMainPageAppBar extends AppBar {
  CustomMainPageAppBar({
    super.key,
    this.appBarActions,
    this.appBarTitle,
    this.barElevation = false,
    this.appBarLeadingWidget,
    this.appbarBackgroundColor = Colors.transparent,
    this.style = const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  }) : super(
          toolbarHeight: kAppBarHeight,
          surfaceTintColor: appbarBackgroundColor,
          shadowColor: AppColor.backGroundColor.withOpacity(0.5),
          excludeHeaderSemantics: false,
          bottomOpacity: 0.0,
          leading: appBarLeadingWidget,
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: appBarTitle,
          ),
          titleSpacing: 12,
          titleTextStyle: AppTextStyle.textSemiBold().copyWith(
            fontSize: 17,
            color: AppColor.blackColor,
          ),
          leadingWidth: 70,
          backgroundColor: AppColor.backGroundColor,
          elevation: barElevation ? 4 : 0,
          actions: appBarActions,
          systemOverlayStyle: style,
        );
  final List<Widget>? appBarActions;
  final Widget? appBarLeadingWidget;
  final Widget? appBarTitle;
  final bool barElevation;
  final Color appbarBackgroundColor;
  final SystemUiOverlayStyle style;
}
