import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/create_create_product/cubit/create_product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductNumbers extends StatelessWidget {
  const ProductNumbers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CreateProductCubit>(),
      child: BlocConsumer<CreateProductCubit, CreateProductState>(
        builder: (context, state) {
          CreateProductCubit cubit =
              BlocProvider.of<CreateProductCubit>(context);
          return ScreenWrapper(
            body: Form(
              key: cubit.numbersFormKey,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppBar(
                        title: ' اضافة منتج جديد',
                        // onBackPressed: () {
                        //   // cubit.changeCurrentPage(isNext: false, context: context);
                        // },
                      ),
                      Padding(
                        padding: EdgeInsets.all(Spaces.height16),
                        child: Text(
                          'تفاصيل المنتج',
                          style: AppTextStyle.headerBold25,
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
                            name: 'العدد',
                            onChange: (value) {},
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            isPassword: false,
                            keyboardType: TextInputType.number,
                          ),
                          FieldSection(
                            controller: cubit.productRate,
                            name: 'التقييم',
                            isPassword: false,
                            keyboardType: TextInputType.number,
                          ),
                          FieldSection(
                            controller: cubit.productMainPrice,
                            name: 'السعر الرئيسي',
                            isPassword: false,
                            keyboardType: TextInputType.number,
                          ),
                          FieldSection(
                            controller: cubit.productSellPrice,
                            name: 'سعر البيع',
                            isPassword: false,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    right: 16.responsiveWidth,
                    left: 16.responsiveWidth,
                    bottom: 16.responsiveHeight,
                    child: PrimeButtom(
                      text: 'التالي',
                      onTap: () {
                        cubit.confirmNumbers(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
