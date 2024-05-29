import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/loading_overlay.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:e_commerce/features/edit_product/presentation/manger/cubit/edit_product_cubit_cubit.dart';
import 'package:e_commerce/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EditProductCubitCubit(productEntity, context)..init(),
      child: BlocBuilder<EditProductCubitCubit, EditProductCubitState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<EditProductCubitCubit>(context);

          return Stack(
            children: [
              ScreenWrapper(
                appBar: CustomMainPageAppBar(
                  appBarTitle: Text(
                    'تعديل المنتج',
                    style: AppTextStyle.medium16,
                  ),
                  appBarActions: [
                    TextButton(
                      onPressed: () {
                        cubit.deleteProduct();
                      },
                      child: Text(
                        'حذف',
                        style: AppTextStyle.medium
                            .copyWith(color: AppColors.redColor),
                      ),
                    ),
                    16.horizontalSpace,
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FieldSection(
                          controller: cubit.describeController,
                          name: "وصف المنتج",
                          maxLines: 10,
                          isPassword: false,
                        ),
                        FieldSection(
                          controller: cubit.amountController,
                          name: "العدد",
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: FieldSection(
                                controller: cubit.mainPriceController,
                                name: "السعر الاساسي",
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: FieldSection(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: cubit.sellPriceController,
                                name: "سعر البيع",
                              ),
                            ),
                          ],
                        ),
                        200.verticalSpace
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16.responsiveHeight,
                right: 30.responsiveWidth,
                left: 30.responsiveWidth,
                child: PrimeButtom(
                  text: "تعديل",
                  onTap: () {
                    cubit.updateProduct();
                  },
                ),
              ),
              if (state is ActiveLoadingState) const LoadingOverlay(),
            ],
          );
        },
      ),
    );
  }
}
