import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/widgets/alesraa_logo_with_text.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/text_form.dart';
import 'package:e_commerce/core/widgets/title_tile.dart';
import 'package:e_commerce/features/search_screen/presentation/view/fillter_sheet.dart';
import 'package:e_commerce/features/search_screen/presentation/widgets/search_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const somthing = 'Search Histrdfsdf';
    return ScreenWrapper(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: _appBar(context),
          ),
          SliverToBoxAdapter(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.all(Spaces.height16),
                  child: _searchField(context),
                ),
                const TitleTile(title: 'RECENT SEARCH'),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => GoRouter.of(context)
                      .push(Routes.productListing, extra: somthing),
                  child: const HistorySearchText(text: somthing)),
              itemCount: 6,
            ),
          ),
        ]),
      ),
    );
  }

  CustomTextForm _searchField(BuildContext context) {
    return CustomTextForm(
      hintText: 'search',
      textEditingController: controller,
      suffixIcon: IconButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              context: context,
              builder: (context) => const FillterSheet(),
            );
          },
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(IconAssets.filterTextIcon)),
      preIcon: IconButton(
          onPressed: () {
            // showBottomSheet(
            //   context: context,
            //   builder: (context) => ,
            // );
          },
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(IconAssets.searchTextIcon)),
    );
  }

  Padding _appBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Spaces.width16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AlesraaLogoWithText(),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(IconAssets.cancelIcon))
        ],
      ),
    );
  }
}
