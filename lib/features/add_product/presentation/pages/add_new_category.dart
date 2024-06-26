import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/buttom.dart';

import 'package:e_commerce/core/widgets/loading_overlay.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:e_commerce/core/widgets/title_tile.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_cubit/cubit/create_category_cubit_cubit.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_cubit/cubit/select_category_cubit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCategory extends StatefulWidget {
  const AddNewCategory({
    super.key,
  });
  // final GlobalKey<FormState> formKey;
  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNewCategoryCubit(context: context),
      child: BlocConsumer<CreateNewCategoryCubit, SelectCategoryCubitState>(
        builder: (context, state) {
          CreateNewCategoryCubit cubit =
              BlocProvider.of<CreateNewCategoryCubit>(context);
          return Stack(
            children: [
              SizedBox(
                height: Spaces.height * .8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'اضافة نوع جديدة',
                        style: AppTextStyle.headerBold25,
                      ),
                      _space(),
                      FieldSection(
                        controller: cubit.categoryName,
                        name: 'اسم النوع',
                        isPassword: false,
                      ),
                      const TitleTile(title: 'الصورة'),
                      Center(
                        child: CupertinoButton(
                          onPressed: () => cubit.addPhoto(),
                          child: Container(
                              width: Spaces.width * .444,
                              height: Spaces.height20 * 5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppColors.grey50),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    12,
                                  ),
                                ),
                                child: cubit.isNoPhoto
                                    ? const Image(
                                        image: AssetImage(
                                          logoImage,
                                        ),
                                      )
                                    : Image.file(
                                        cubit.categoryTypeFile!,
                                        fit: BoxFit.scaleDown,
                                      ),
                              )),
                        ),
                      ),
                      // const TitleTile(title: 'final show'),
                      // Center(
                      //   child: SizedBox(
                      //     width: Spaces.width * .444,
                      //     height: Spaces.height20 * 5,
                      //     child: CategoryWidget(
                      //       childImage: cubit.isNoPhoto
                      //           ? const Image(image: AssetImage(logoImage))
                      //           : Image.file(
                      //               cubit.categoryTypeFile!,
                      //               fit: BoxFit.cover,
                      //             ),
                      //       text: cubit.categoryName.text,
                      //     ),
                      //   ),
                      // ),
                      100.verticalSpace
                    ],
                  ),
                ),
              ),
              // PrimeButtom(
              //   text: 'Continue',
              //   onTap: () {
              //     cubit.confirmButtom();
              //   },
              // ),
              Positioned(
                right: 16.responsiveWidth,
                left: 16.responsiveWidth,
                bottom: 16.responsiveHeight,
                child: PrimeButtom(
                  text: 'التالي',
                  onTap: () {
                    cubit.confirmButtom();
                  },
                ),
              ),
              if (state is ActiveLoadingState) const LoadingOverlay()
            ],
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}

Widget _space() {
  return SizedBox(
    height: Spaces.height16,
  );
}
