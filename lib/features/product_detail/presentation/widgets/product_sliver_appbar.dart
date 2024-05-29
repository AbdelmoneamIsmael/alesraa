import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/widgets/cashed_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ProductSliverAppBar extends StatelessWidget {
  const ProductSliverAppBar({
    required this.image,
    super.key,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: CupertinoButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(IconAssets.arrowBackIcon),
      ),
      backgroundColor: AppColors.backGroundColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      floating: false,
      pinned: true,
      snap: false,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(Spaces.height20),
          child: Container(
            height: Spaces.height20,
            decoration: BoxDecoration(
                color: AppColors.backGroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                )),
          )),
      elevation: 0,
      expandedHeight: Spaces.height * .3625,
      flexibleSpace: FlexibleSpaceBar(
          background:
              FittedBox(fit: BoxFit.cover, child: CashedImage(url: image))),
    );
  }
}
