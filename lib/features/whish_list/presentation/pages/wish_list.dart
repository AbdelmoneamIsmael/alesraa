import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';

import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/no_data_widget.dart';
import 'package:e_commerce/features/whish_list/presentation/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenWrapper(
          body: Column(
        children: [
          const CustomAppBar(
            title: 'Wish List',
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const WishListItem(),
              itemCount: 20,
            ),
          ),
        ],
      )),
    );
  }

  NoDataWidget noData() {
    return NoDataWidget(
      imagePath: emptyWishListImage,
      title: 'Your wishlist is empty',
      caption: 'Tap heart button to start saving your favorite items',
      buttonText: 'Explore Categories',
      onTap: () {},
    );
  }
}
