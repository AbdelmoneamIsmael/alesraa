import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/strings.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 120,
        child: Row(
          children: List.generate(
            markLabels.length,
            (index) => AspectRatio(
              aspectRatio: 76 / 60,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () => GoRouter.of(context).push(
                    PageRoutes.productsDebendOnCategory,
                    extra: markLabels[index]),
                child: CategoryWidget(
                  image: AssetImage(AssetsImages.markIcons[index]),
                  text: markLabels[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
