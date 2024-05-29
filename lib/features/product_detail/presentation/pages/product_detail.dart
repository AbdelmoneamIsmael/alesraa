import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/title_tile.dart';
import 'package:e_commerce/features/product_listing/domain/entities/product_entity.dart';
import 'package:e_commerce/features/product_detail/presentation/widgets/budget.dart';
import 'package:e_commerce/features/product_detail/presentation/widgets/pragraph_text.dart';
import 'package:e_commerce/features/product_detail/presentation/widgets/product_sliver_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProdyuctDetail extends StatefulWidget {
  const ProdyuctDetail({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  State<ProdyuctDetail> createState() => _ProdyuctDetailState();
}

class _ProdyuctDetailState extends State<ProdyuctDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // statusAppBarColor: Colors.red,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        // shrinkWrap: true,

        slivers: [
          ProductSliverAppBar(
            image: widget.productEntity.pImage,
          ),
          SliverList.list(
            children: [
              _budgets(),
              16.verticalSpace,
              _title(),
              _rating(rate: widget.productEntity.pRating.toDouble()),
              ParagraphText(
                text: widget.productEntity.pDescribtion,
                textHeight: (Spaces.height * .2675).toInt(),
              ),
              TitleTile(title: '   الكمية  (${widget.productEntity.pAmount})'),
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
                    GoRouter.of(context).push(Routes.cartScreen);
                  },
                  widgetNextToText: SvgPicture.asset(IconAssets.cartIcon),
                  textFontSize: 14,
                )),
              ],
            ),
            10.verticalSpace
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
              widget.productEntity.pName,
              style: AppTextStyle.headerBold25.copyWith(fontSize: 18),
            ),
          ),
          SizedBox(
            width: Spaces.width * .111,
          ),
          Column(
            children: [
              Text(
                '\$ ${widget.productEntity.pPrice} ',
                style: AppTextStyle.headerBold25.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: Spaces.height5,
              ),
              Text(
                '\$ ${widget.productEntity.pmainPrice}',
                style: const TextStyle(
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
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              children: [
                Budget(
                    text: widget.productEntity.pCategory,
                    color: AppColors.purpleColor),
                Budget(
                  text: widget.productEntity.pKind,
                  color: AppColors.cyanColor,
                ),
              ],
            ),
          ),
          10.horizontalSpace,
          SizedBox(
            height: 40.responsiveHeight,
            child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context)
                      .push(Routes.editProduct, extra: widget.productEntity);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(5.responsiveHeight),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.responsiveWidth),
                  ),
                  backgroundColor: AppColors.brownColor,
                ),
                child: Text(
                  "تعديل",
                  style: AppTextStyle.medium12.copyWith(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
