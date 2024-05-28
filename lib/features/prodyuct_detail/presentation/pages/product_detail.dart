import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/title_tile.dart';
import 'package:e_commerce/features/prodyuct_detail/presentation/widgets/budget.dart';
import 'package:e_commerce/features/prodyuct_detail/presentation/widgets/pragraph_text.dart';
import 'package:e_commerce/features/prodyuct_detail/presentation/widgets/product_sliver_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProdyuctDetail extends StatefulWidget {
  const ProdyuctDetail({super.key});

  @override
  State<ProdyuctDetail> createState() => _ProdyuctDetailState();
}

class _ProdyuctDetailState extends State<ProdyuctDetail> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        // shrinkWrap: true,

        slivers: [
          const ProductSliverAppBar(),
          SliverList.list(
            children: [
              _budgets(),
              _title(),
              _rating(rate: 4.5),
              ParagraphText(
                text: _paragraph(),
                textHeight: (Spaces.height * .2675).toInt(),
              ),
              const TitleTile(title: 'Quantity'),
              _quantity(),
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: _bottomSection(),
          )
        ],
      ),
    );
  }

  Padding _bottomSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spaces.height16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: PrimeButtom(
                    height: Spaces.width * .1666,
                    text: 'Buy Now',
                    textFontSize: 14,
                    onTap: () {},
                    backgroundColor: AppColors.backGroundColor,
                    textColor: AppColors.blackColor,
                  ),
                ),
                SizedBox(
                  width: Spaces.width10,
                ),
                Expanded(
                    child: PrimeButtom(
                  text: 'Add To Cart',
                  height: Spaces.width * .1666,
                  onTap: () {
                    GoRouter.of(context).push(PageRoutes.cartScreen);
                  },
                  widgetNextToText: SvgPicture.asset(IconAssets.cartIcon),
                  textFontSize: 14,
                )),
              ],
            ),
            Container(
              height: 5,
              margin: EdgeInsets.symmetric(
                  horizontal: Spaces.width * .333, vertical: Spaces.height8),
              decoration: const BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align _quantity() {
    return Align(
      alignment: Alignment.topLeft,
      child: UnconstrainedBox(
        child: Padding(
          padding: EdgeInsets.only(bottom: Spaces.height16),
          child: Container(
            width: Spaces.width * .2666,
            padding: EdgeInsets.all(Spaces.height8),
            margin: EdgeInsets.symmetric(horizontal: Spaces.width16),
            decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                  BorderSide(color: AppColors.grey50)),
              borderRadius: BorderRadius.all(Radius.circular(Spaces.height8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    child: Text(
                      '-',
                      style: AppTextStyle.medium,
                    ),
                    onPressed: () {}),
                Text(
                  '0',
                  style: AppTextStyle.medium,
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    child: Text(
                      '+',
                      style: AppTextStyle.medium,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _rating({required double rate}) {
    var halfStar = false;

    var starCount = rate.toInt();
    if (rate - starCount != 0) {
      halfStar = true;
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Spaces.width16,
        vertical: Spaces.height * .01781,
      ),
      child: SizedBox(
        height: Spaces.height16,
        child: Row(
          children: [
            ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => starCount - 1 >= index
                  ? SvgPicture.asset(IconAssets.starIcon)
                  : halfStar && starCount == index
                      ? SvgPicture.asset(IconAssets.halfStarIcon)
                      : SvgPicture.asset(
                          IconAssets.starIcon,
                          colorFilter: const ColorFilter.mode(
                              AppColors.grey100, BlendMode.srcIn),
                        ),
              itemCount: 5,
            ),
            SizedBox(
              width: Spaces.width8,
            ),
            Text(
              '$rate (2,495 reviews) ',
              style: AppTextStyle.medium.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Padding _title() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spaces.height16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Loop Silicone Strong Magnetic watch',
              style: AppTextStyle.headerBold25.copyWith(fontSize: 18),
            ),
          ),
          SizedBox(
            width: Spaces.width * .111,
          ),
          Column(
            children: [
              Text(
                '\$ 320.25 ',
                style: AppTextStyle.headerBold25.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: Spaces.height5,
              ),
              const Text(
                '\$ 400.00',
                style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grey100,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PlusJakartaSans',
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _budgets() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spaces.width16),
      child: const Wrap(
        children: [
          Budget(text: 'Free Shipping', color: AppColors.purpleColor),
          Budget(
            text: 'Top Rated',
            color: AppColors.cyanColor,
          ),
        ],
      ),
    );
  }

  String _paragraph() {
    return 'Constructed with high-quality silicone material, the Loop Silicone Strong Magnetic Watch ensures a comfortable and secure fit on your wrist. The soft and flexible silicone is gentle on the skin, making it ideal for extended wear. Its lightweight design allows for a seamless blend of comfort and durability.\nOne of the standout features of this watch band is its strong magnetic closure. The powerful magnets embedded within the band provide a secure and reliable connection, ensuring that your smartwatch stays firmly in place throughout the day. Say goodbye to worries about accidental detachment or slippage - the magnetic closure offers a peace of mind for active individuals on the go.\nThe Loop Silicone Strong Magnetic Watch Band is highly versatile, compatible with a wide range of smartwatch models. Its adjustable strap length allows for a customizable fit, catering to various wrist sizes. Whether you\'re engaging in intense workouts or attending formal occasions, this watch band effortlessly adapts to your style and activity level.';
  }
}
