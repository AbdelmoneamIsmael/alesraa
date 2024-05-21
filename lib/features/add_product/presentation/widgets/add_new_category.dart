import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/category_item.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:e_commerce/core/widgets/title_tile.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
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
    return Padding(
      padding: EdgeInsets.all(Spaces.height16),
      child: BlocConsumer<AddProductCubit, AddProductState>(
        builder: (context, state) {
          AddProductCubit cubit = BlocProvider.of<AddProductCubit>(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Category',
                style: AppTextStyle.headerBold().copyWith(fontSize: 24),
              ),
              _space(),
              FieldSection(
                controller: cubit.typeName,
                name: 'Category Name',
                isPassword: false,
              ),
              const TitleTile(title: 'Image'),
              Center(
                child: CupertinoButton(
                  onPressed: () => cubit.addPhoto(context, 0),
                  child: Container(
                      width: Spaces.width * .444,
                      height: Spaces.height20 * 5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColor.grey50),
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
                                cubit.categoryTypeFile,
                                fit: BoxFit.scaleDown,
                              ),
                      )),
                ),
              ),
              const TitleTile(title: 'final show'),
              Center(
                child: SizedBox(
                  width: Spaces.width * .444,
                  height: Spaces.height20 * 5,
                  child: CategoryWidget(
                    childImage: cubit.isNoPhoto
                        ? const Image(image: AssetImage(logoImage))
                        : Image.file(
                            cubit.categoryTypeFile,
                            fit: BoxFit.cover,
                          ),
                    text: cubit.typeName.text,
                  ),
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
