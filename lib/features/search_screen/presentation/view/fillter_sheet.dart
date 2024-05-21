import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/title_tile.dart';
import 'package:e_commerce/features/search_screen/presentation/widgets/cheek_options.dart';
import 'package:flutter/material.dart';

class FillterSheet extends StatelessWidget {
  const FillterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      width: Spaces.width,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _devider(),
          const TitleTile(
            title: 'Fillter',
            fontSize: 16,
          ),
          _checkItem(),
          _apply(),
          Container(
            height: Spaces.height5,
            margin:
                EdgeInsets.symmetric(vertical: Spaces.height5, horizontal: 120),
            decoration: const BoxDecoration(
              color: AppColor.blackColor,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          )
        ],
      ),
    );
  }

  Padding _apply() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Spaces.height16,
        left: Spaces.width16,
        right: Spaces.width16,
        top: Spaces.height20 + Spaces.height5,
      ),
      child: PrimeButtom(text: 'Apply', onTap: () {}),
    );
  }

  Widget _checkItem() {
    return const SearchOptions();
  }

  Container _devider() {
    return Container(
      height: 3,
      margin: EdgeInsets.symmetric(horizontal: 150, vertical: Spaces.height16),
      decoration: const BoxDecoration(
          color: AppColor.grey50,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
