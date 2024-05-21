import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/category_screen/presentation/widgets/category_list.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainPageAppBar(
        appBarTitle: Text(
          'Categories',
          style: AppTextStyle.textMedium(),
        ),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _devider(),
                const SizedBox(height: 12),
              ],
            ),
          ),
          const CategoryList(),
        ],
      )),
    );
  }

  Container _devider() {
    return Container(
      height: 2,
      color: AppColor.grey50,
    );
  }
}
