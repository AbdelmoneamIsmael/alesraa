import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:e_commerce/core/widgets/title_tile.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_kind_cubit/cubit/create_category_kind_cubit.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_kind_cubit/cubit/select_category_kind_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCategoryKind extends StatefulWidget {
  const AddNewCategoryKind({
    super.key,
  });
  // final GlobalKey<FormState> formKey;
  @override
  State<AddNewCategoryKind> createState() => _AddNewCategoryKindState();
}

class _AddNewCategoryKindState extends State<AddNewCategoryKind> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Spaces.height16),
      child: BlocConsumer<CreateNewCategoryKindCubit, SelectCategoryKindState>(
        builder: (context, state) {
          CreateNewCategoryKindCubit cubit =
              BlocProvider.of<CreateNewCategoryKindCubit>(context);
          return Stack(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'اضافة فئة جديدة',
                            style: AppTextStyle.headerBold25,
                          ),
                          _space(),
                          FieldSection(
                            onChange: (value) {
                              setState(() {
                                cubit.kindName.text = value;
                              });
                            },
                            controller: cubit.kindName,
                            name: 'اسم الفئة',
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
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              logoImage,
                                            ),
                                          )
                                        : Image.file(
                                            cubit.kindeFile!,
                                            fit: BoxFit.contain,
                                          ),
                                  )),
                            ),
                          ),
                          // const TitleTile(title: 'final show'),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: AspectRatio(
                          //     aspectRatio: 100 / 50,
                          //     child: TypeItem(
                          //       childImage: cubit.isNoPhoto
                          //           ? Image(
                          //               height: Spaces.height * .15,
                          //               image: const AssetImage(
                          //                 logoImage,
                          //               ),
                          //               fit: BoxFit.cover,
                          //             )
                          //           : Image.file(
                          //               cubit.kindeFile!,
                          //               fit: BoxFit.cover,
                          //               height: Spaces.height * .15,
                          //               width: Spaces.width * .444,
                          //             ),
                          //       text: cubit.kindName.text,
                          //     ),
                          //   ),
                          // ),
                          100.verticalSpace
                        ],
                      ),
                    ),
                  ),
                );
              }),
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
