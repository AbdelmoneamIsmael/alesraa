import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/features/search_screen/presentation/cubit/search_screen_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsOne = ['Price (Low to High)', 'Price (High to Low)'];
    final itemstwo = ['A-Z', 'Z-A'];
    return Padding(
      padding: EdgeInsets.all(Spaces.height16),
      child: BlocProvider(
        create: (context) => SearchScreenCubit(),
        child: BlocConsumer<SearchScreenCubit, SearchScreenState>(
          builder: (context, state) => Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => CupertinoButton(
                  onPressed: () {
                    BlocProvider.of<SearchScreenCubit>(context)
                        .changeHighToLowValue();
                  },
                  child: _item(
                      text: itemsOne[index],
                      cubit: BlocProvider.of<SearchScreenCubit>(context),
                      index: index,
                      section: 0),
                ),
                itemCount: 2,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => CupertinoButton(
                    onPressed: () {
                      BlocProvider.of<SearchScreenCubit>(context)
                          .changeAToZValue();
                    },
                    child: _item(
                        index: index,
                        text: itemstwo[index],
                        cubit: BlocProvider.of<SearchScreenCubit>(context),
                        section: 1)),
                itemCount: 2,
              ),
            ],
          ),
          listener: (context, state) {},
        ),
      ),
    );
  }

  Widget _item({
    required String text,
    required SearchScreenCubit cubit,
    required int section,
    required int index,
  }) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(section == 0
                ? index == 0
                    ? cubit.isHighToLow
                        ? IconAssets.checkBoxIcon
                        : IconAssets.unCheckBoxIcon
                    : cubit.isLowtoHigh
                        ? IconAssets.checkBoxIcon
                        : IconAssets.unCheckBoxIcon
                : index == 0
                    ? cubit.isAToZ
                        ? IconAssets.checkBoxIcon
                        : IconAssets.unCheckBoxIcon
                    : cubit.isZtoA
                        ? IconAssets.checkBoxIcon
                        : IconAssets.unCheckBoxIcon),
            SizedBox(
              width: Spaces.height16,
            ),
            Text(
              text,
              style: AppTextStyle.textMedium,
            )
          ],
        ),
        Container(
          height: 1,
          color: AppColors.grey50,
        )
      ],
    );
  }
}
