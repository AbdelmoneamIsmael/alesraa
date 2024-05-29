import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/strings.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SubCategoryWidgetsList extends StatelessWidget {
  const SubCategoryWidgetsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: categoryLabels.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),
      itemBuilder: (context, index) => CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          GoRouter.of(context).push(
            Routes.productListing,
            extra: categoryLabels[index],
          );
        },
        child: CategoryWidget(
            image: AssetImage(AssetsImages.categoryIcons[index]),
            text: categoryLabels[index]),
      ),
    );
  }
}
