import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/my_cart/presentation/widgets/cart_item.dart';
import 'package:e_commerce/features/my_cart/presentation/widgets/invoice_details.dart';
import 'package:flutter/material.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenWrapper(
        appBar: CustomMainPageAppBar(
            appBarTitle: Text(
          'My Cart',
          style: AppTextStyle.textMedium14,
        )),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverList.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) => const CartItem(),
                ),
              ],
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: IvoiceDetails(),
            ),
          ],
        ),
      ),
    );
  }
}
