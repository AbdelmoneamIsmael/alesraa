import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/widgets/title_tile.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:e_commerce/features/prodyuct_detail/presentation/widgets/budget.dart';
import 'package:e_commerce/features/prodyuct_detail/presentation/widgets/pragraph_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinalReview extends StatefulWidget {
  const FinalReview({super.key});

  @override
  State<FinalReview> createState() => _FinalReviewState();
}

class _FinalReviewState extends State<FinalReview> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        AddProductCubit cubit = BlocProvider.of(context);
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          // shrinkWrap: true,

          slivers: [
            _appBar(context, cubit),
            SliverToBoxAdapter(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _budgets(),
                  _title(
                    cubit,
                  ),
                  _rating(
                    rate: double.parse(cubit.productRate.text),
                  ),
                  ParagraphText(
                    text: cubit.productDetails.text,
                    textHeight: (Spaces.height * .2675).toInt(),
                  ),
                  const TitleTile(title: 'Quantity'),
                  _quantity(
                    cubit,
                  ),
                ],
              ),
            ),
          ],
        );
      },
      listener: (context, state) {},
    );
  }

  Widget _quantity(
    AddProductCubit cubit,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UnconstrainedBox(
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
                        style: AppTextStyle.textSemiBold(),
                      ),
                      onPressed: () {
                        if (0 < index) {
                          setState(() {
                            index--;
                          });
                        }
                      }),
                  Text(
                    '$index',
                    style: AppTextStyle.textSemiBold(),
                  ),
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      child: Text(
                        '+',
                        style: AppTextStyle.textSemiBold(),
                      ),
                      onPressed: () {
                        if (int.parse(cubit.productAmount.text) > index) {
                          setState(() {
                            index++;
                          });
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'There is ${cubit.productAmount.text} Left',
            style: AppTextStyle.captionStyle(),
          ),
        )
      ],
    );
  }

  Padding _rating({
    required double rate,
  }) {
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
              style: AppTextStyle.textSemiBold().copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Padding _title(
    AddProductCubit cubit,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spaces.height16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              cubit.productName.text,
              style: AppTextStyle.headerBold().copyWith(fontSize: 18),
            ),
          ),
          SizedBox(
            width: Spaces.width * .111,
          ),
          Column(
            children: [
              Text(
                '\$ ${cubit.productSellPrice.text} ',
                style: AppTextStyle.headerBold().copyWith(fontSize: 18),
              ),
              SizedBox(
                height: Spaces.height5,
              ),
              Text(
                '\$ ${cubit.productMainPrice.text}',
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

  SliverAppBar _appBar(
    BuildContext context,
    AddProductCubit cubit,
  ) {
    return SliverAppBar(
      leading: _back(context, cubit),
      backgroundColor: AppColors.backGroundColor,
      floating: false,
      pinned: true,
      snap: false,
      actions: [
        _wishlist(),
      ],
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
        background: Image.file(
          cubit.productImageFile,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  CupertinoButton _wishlist() {
    return CupertinoButton(
        onPressed: () {}, child: SvgPicture.asset(IconAssets.wishlistIcon));
  }

  CupertinoButton _back(BuildContext context, AddProductCubit cubit) {
    return CupertinoButton(
        onPressed: () {
          cubit.changeCurrentPage(isNext: false, context: context);
        },
        child: SvgPicture.asset(IconAssets.arrowBackIcon));
  }

//   String _paragraph() {
//     return 'Constructed with high-quality silicone material, the Loop Silicone Strong Magnetic Watch ensures a comfortable and secure fit on your wrist. The soft and flexible silicone is gentle on the skin, making it ideal for extended wear. Its lightweight design allows for a seamless blend of comfort and durability.\nOne of the standout features of this watch band is its strong magnetic closure. The powerful magnets embedded within the band provide a secure and reliable connection, ensuring that your smartwatch stays firmly in place throughout the day. Say goodbye to worries about accidental detachment or slippage - the magnetic closure offers a peace of mind for active individuals on the go.\nThe Loop Silicone Strong Magnetic Watch Band is highly versatile, compatible with a wide range of smartwatch models. Its adjustable strap length allows for a customizable fit, catering to various wrist sizes. Whether you\'re engaging in intense workouts or attending formal occasions, this watch band effortlessly adapts to your style and activity level.';
//   }
}
