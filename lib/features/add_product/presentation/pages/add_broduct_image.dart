import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/link_text.dart';
import 'package:e_commerce/core/widgets/loading_overlay.dart';
import 'package:e_commerce/core/widgets/no_data_widget.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/create_create_product/cubit/create_product_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CreateProductCubit>(),
      child: BlocConsumer<CreateProductCubit, CreateProductState>(
        builder: (context, state) {
          CreateProductCubit cubit =
              BlocProvider.of<CreateProductCubit>(context);
          return ScreenWrapper(
            body: Stack(
              children: [
                Column(
                  children: [
                    const CustomAppBar(
                      title: 'اختر صورة المنتج',
                      // onBackPressed: () {
                      //   // cubit.changeCurrentPage(isNext: false, context: context);
                      // },
                    ),
                    Padding(
                      padding: EdgeInsets.all(Spaces.height16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'time to add Image',
                                style: AppTextStyle.headerBold()
                                    .copyWith(fontSize: 24),
                              ),
                              LinkText(
                                onTap: () {
                                  cubit.addPhoto(context);
                                },
                                text: 'Add Photo',
                                height: 2.5,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: cubit.isNoPhoto
                                ? Spaces.height10 * 7
                                : Spaces.height * .1575,
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(24)),
                              child: cubit.isNoPhoto
                                  ? NoDataWidget(
                                      imagePath: addImage,
                                      title: 'Select Image',
                                      caption:
                                          'You have To Select image Of Product make it clear please',
                                      buttonText: 'Select Image',
                                      onTap: () {
                                        cubit.addPhoto(context);
                                      },
                                    )
                                  : Image.file(
                                      cubit.productImage!,
                                      height: Spaces.height * .3325,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  right: 16.responsiveWidth,
                  left: 16.responsiveWidth,
                  bottom: 16.responsiveHeight,
                  child: PrimeButtom(
                    text: 'Continue',
                    onTap: () {
                      cubit.uploadeProduct(context);
                    },
                  ),
                ),
                if (state is ActiveLoadingState) const LoadingOverlay()
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
