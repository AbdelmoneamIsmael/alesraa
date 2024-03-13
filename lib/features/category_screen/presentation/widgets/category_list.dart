import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/strings.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 160 / 100,
      ),
      itemBuilder: (context, index) => CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          GoRouter.of(context).push(PageRoutes.productsDebendOnCategory,
              extra: markLabels[index]);
        },
        child: CategoryWidget(
          image: AssetImage(AssetsImages.markIcons[index]),
          text: markLabels[index],
        ),
      ),
    );
  }
}
