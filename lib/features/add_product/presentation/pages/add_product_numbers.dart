import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductNumbers extends StatefulWidget {
  const ProductNumbers({super.key});

  @override
  State<ProductNumbers> createState() => _ProductNumbersState();
}

class _ProductNumbersState extends State<ProductNumbers> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        AddProductCubit cubit = BlocProvider.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Category Kind',
              onBackPressed: () {
                cubit.changeCurrentPage(isNext: false, context: context);
              },
            ),
            Padding(
              padding: EdgeInsets.all(Spaces.height16),
              child: Text(
                'time to add product',
                style: AppTextStyle.headerBold().copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: Spaces.height16,
            ),
            GridView.count(
              padding: EdgeInsets.all(Spaces.height16),
              shrinkWrap: true,
              crossAxisSpacing: Spaces.width10,
              mainAxisSpacing: Spaces.height10,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: [
                FieldSection(
                  controller: cubit.productAmount,
                  name: 'Amount',
                  onChange: (value) {
                    setState(() {
                      num.parse(value) is int
                          ? cubit.productAmount.text = value
                          : cubit.productAmount.text =
                              num.parse(value).toInt().toString();
                    });
                  },
                  isPassword: false,
                  keyboardType: TextInputType.number,
                ),
                FieldSection(
                  controller: cubit.productRate,
                  name: 'Rating',
                  isPassword: false,
                  keyboardType: TextInputType.number,
                ),
                FieldSection(
                  controller: cubit.productMainPrice,
                  name: 'Main Price',
                  isPassword: false,
                  keyboardType: TextInputType.number,
                ),
                FieldSection(
                  controller: cubit.productSellPrice,
                  name: 'SellPrice',
                  isPassword: false,
                  keyboardType: TextInputType.number,
                ),
              ],
            )
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
