import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/features/my_cart/presentation/widgets/quantity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Spaces.height16),
      child: AspectRatio(
        aspectRatio: 100 / 40,
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image(
                    image: AssetImage(
                      'assets/images/samsungTv.avif',
                    ),
                    fit: BoxFit.cover,
                    // height: Spaces.height * .15,
                    // width: Spaces.width * .333,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Spaces.width8,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'Loop Silicone Strong Magnetic Watch',
                            style: AppTextStyle.textMedium(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$ 15.25',
                          style: AppTextStyle.headerSemiBold()
                              .copyWith(fontSize: 12),
                        ),
                        Text(
                          '\$ 20.00',
                          style: AppTextStyle.captionStyle().copyWith(
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                              height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Quantity(
                        count: 0,
                        onMinusTap: () {},
                        onPlusTap: () {},
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        minSize: 0,
                        onPressed: () {},
                        child: SvgPicture.asset(
                          IconAssets.trashIcon,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
