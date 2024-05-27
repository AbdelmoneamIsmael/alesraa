import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SliverGridView extends StatelessWidget {
  const SliverGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: 4,
        (context, index) => CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            GoRouter.of(context).push(PageRoutes.productDetatils);
          },
          child: ProductCard(index: index),
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 160 / 270,
      ),
    );
  }
}
