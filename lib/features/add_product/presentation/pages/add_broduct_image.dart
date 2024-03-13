import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/link_text.dart';
import 'package:e_commerce/core/widgets/no_data_widget.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        AddProductCubit cubit = BlocProvider.of<AddProductCubit>(context);
        return Column(
          children: [
            CustomAppBar(
              title: 'Category Kind',
              onBackPressed: () {
                cubit.changeCurrentPage(isNext: false, context: context);
              },
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
                        style: AppTextStyle.headerBold().copyWith(fontSize: 24),
                      ),
                      LinkText(
                        onTap: () {
                          cubit.addPhoto(context, 2);
                        },
                        text: 'Add Photo',
                        height: 2.5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: cubit.isNoProductPhoto
                        ? Spaces.height10 * 7
                        : Spaces.height * .1575,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      child: cubit.isNoProductPhoto
                          ? NoDataWidget(
                              imagePath: addImage,
                              title: 'Select Image',
                              caption:
                                  'You have To Select image Of Product make it clear please',
                              buttonText: 'Select Image',
                              onTap: () {
                                cubit.addPhoto(context, 2);
                              })
                          : Image.file(
                              cubit.productImageFile,
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
        );
      },
      listener: (context, state) {},
    );
  }
}
