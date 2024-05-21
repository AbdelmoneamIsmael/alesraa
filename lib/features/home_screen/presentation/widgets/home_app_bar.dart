import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/values.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/widgets/alesraa_logo_with_text.dart';
import 'package:e_commerce/core/widgets/box_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({super.key, required BuildContext context})
      : super(
          backgroundColor: AppColor.backGroundColor,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: AlesraaLogoWithText(),
          ),
          leadingWidth: double.infinity,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColor.backGroundColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          toolbarHeight: kAppBarHeight,
          elevation: 0,
          actions: [
            IconButton(
              icon: SvgPicture.asset(searchIcon),
              onPressed: () =>
                  GoRouter.of(context).push(PageRoutes.searchScreen),
            ),
            const SizedBox(
              width: 12,
            ),
            const BoxProfile(),
          ],
        );
}
