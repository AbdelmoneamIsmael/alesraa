import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:e_commerce/core/widgets/title_tile.dart';
import 'package:e_commerce/core/widgets/type_item.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
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
      child: BlocConsumer<AddProductCubit, AddProductState>(
        builder: (context, state) {
          AddProductCubit cubit = BlocProvider.of<AddProductCubit>(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Category Kind',
                style: AppTextStyle.headerBold().copyWith(fontSize: 24),
              ),
              _space(),
              FieldSection(
                onChange: (value) {
                  setState(() {
                    cubit.kindName.text = value;
                  });
                },
                controller: cubit.typeName,
                name: 'Category Kind Name',
                isPassword: false,
              ),
              const TitleTile(title: 'Image'),
              Center(
                child: CupertinoButton(
                  onPressed: () => cubit.addPhoto(context, 1),
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
                        child: cubit.isNoKindPhoto
                            ? const Image(
                                image: AssetImage(
                                  logoImage,
                                ),
                              )
                            : Image.file(
                                cubit.categoryKindFile,
                                fit: BoxFit.cover,
                              ),
                      )),
                ),
              ),
              const TitleTile(title: 'final show'),
              Center(
                child: TypeItem(
                  childImage: cubit.isNoKindPhoto
                      ? Image(
                          height: Spaces.height * .15,
                          image: const AssetImage(
                            logoImage,
                          ),
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          cubit.categoryKindFile,
                          fit: BoxFit.cover,
                          height: Spaces.height * .15,
                          width: Spaces.width * .444,
                        ),
                  text: cubit.kindName.text,
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
