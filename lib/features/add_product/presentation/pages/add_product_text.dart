import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductText extends StatefulWidget {
  const ProductText({super.key});

  @override
  State<ProductText> createState() => _ProductTextState();
}

class _ProductTextState extends State<ProductText> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        AddProductCubit cubit = BlocProvider.of(context);
        return Form(
          key: cubit.productTextFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Category Kind',
                onBackPressed: () {
                  // cubit.changeCurrentPage(isNext: false, context: context);
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(Spaces.height16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'time to add product',
                          style:
                              AppTextStyle.headerBold().copyWith(fontSize: 24),
                        ),
                        _space(),
                        FieldSection(
                          onChange: (value) {
                            setState(() {
                              cubit.productName.text = value;
                            });
                          },
                          controller: cubit.productName,
                          name: 'Product Name',
                          isPassword: false,
                        ),
                        FieldSection(
                          onChange: (value) {
                            setState(() {
                              cubit.productcode.text = value;
                            });
                          },
                          controller: cubit.productcode,
                          name: 'Product Code',
                          isPassword: false,
                          isRequered: false,
                        ),
                        SizedBox(
                          height: Spaces.height24 * 15,
                          child: FieldSection(
                            onChange: (value) {
                              setState(() {
                                cubit.productDetails.text = value;
                              });
                            },
                            controller: cubit.productDetails,
                            name: 'Product Details',
                            keyboardType: TextInputType.multiline,
                            isPassword: false,
                            maxLines: 15,
                          ),
                        ),
                        SizedBox(
                          height: Spaces.height24 * 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget _space() {
    return SizedBox(
      height: Spaces.height16,
    );
  }
}
