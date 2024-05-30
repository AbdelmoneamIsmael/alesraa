import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/const/values.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/title_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: CustomScrollView(
        slivers: [
          _appBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const TitleTile(title: 'فسم المنتجات'),
                    Option(
                      iconPath: IconAssets.addProductIcon,
                      text: 'اضافة منتج',
                      onPressed: () {
                        GoRouter.of(context).push(Routes.categoryType);
                      },
                    ),
                    Option(
                      iconPath: IconAssets.invintoryIcon,
                      text: 'جرد المنتجات',
                      onPressed: () {},
                    ),
                    const TitleTile(title: 'مركز المساعدة'),
                    Option(
                      iconPath: IconAssets.questionsIcon,
                      text: 'FAQs',
                      onPressed: () {
                        GoRouter.of(context).push(Routes.faqScreen);
                      },
                    ),
                    Option(
                      iconPath: IconAssets.termsIcon,
                      text: 'سياسة الخصوصية',
                      onPressed: () {
                        GoRouter.of(context).push(Routes.termsScreen);
                      },
                    ),
                    const TitleTile(title: 'ادارة الحساب'),
                    Option(
                      iconPath: IconAssets.lockIcon,
                      text: 'تغيير كلمة المرور',
                      onPressed: () {
                        GoRouter.of(context).push(Routes.oldPass);
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHeight),
        child: Container(
          width: Spaces.width,
          height: Spaces.height20,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )),
        ),
      ),
      expandedHeight: Spaces.height * .125,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Spaces.width10, vertical: Spaces.height16),
          decoration: const BoxDecoration(
              color: AppColors.cyanColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              )),
          child: Padding(
            padding: EdgeInsets.all(Spaces.height16),
            child: SafeArea(child: _appBarContent()),
          ),
        ),
      ),
    );
  }

  Row _appBarContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _iconName(),
            SizedBox(
              width: Spaces.width8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abdelmoneam Ismael',
                  style: AppTextStyle.medium.copyWith(color: Colors.white),
                ),
                Text(
                  'abdo20@gmail.com',
                  style: AppTextStyle.medium
                      .copyWith(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          child: SvgPicture.asset(IconAssets.logOuttIcon),
          onPressed: () {},
        )
      ],
    );
  }

  Container _iconName() {
    return Container(
      height: Spaces.height20 * 2,
      width: Spaces.width20 * 2,
      decoration: const BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Text(
          'A I',
          style: AppTextStyle.medium.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onPressed,
  });
  final String iconPath;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: onPressed,
      child: Container(
        height: Spaces.height * .06,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: Spaces.width16, vertical: Spaces.height10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.grey50),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(iconPath),
                SizedBox(
                  width: Spaces.width8,
                ),
                Text(
                  text,
                  style: AppTextStyle.medium.copyWith(
                    color: AppColors.grey150,
                  ),
                ),
              ],
            ),
            Transform.rotate(
              angle: 3.14 * 1,
              child: SvgPicture.asset(
                IconAssets.goIcon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
