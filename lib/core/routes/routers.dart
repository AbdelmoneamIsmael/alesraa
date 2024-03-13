import 'package:e_commerce/features/Profile/presentation/pages/profile.dart';
import 'package:e_commerce/features/add_product/presentation/pages/main_add_roduct.dart';
import 'package:e_commerce/features/change_password/presentation/pages/change_new_password.dart';
import 'package:e_commerce/features/change_password/presentation/pages/change_password.dart';
import 'package:e_commerce/features/main_screen/presentation/screens/main_screen.dart';
import 'package:e_commerce/features/my_cart/presentation/pages/my_cart_screen.dart';
import 'package:e_commerce/features/product_listing/presentation/pages/product_listing_screen.dart';
import 'package:e_commerce/features/products_related_to_category/presentation/pages/products_debend_on_category.dart';
import 'package:e_commerce/features/prodyuct_detail/presentation/pages/product_detail.dart';
import 'package:e_commerce/features/search_screen/presentation/pages/search_screen.dart';
import 'package:e_commerce/features/sign_up_login/presentation/pages/sign_in_screen.dart';
import 'package:e_commerce/features/sign_up_login/presentation/pages/sign_up.dart';
import 'package:e_commerce/features/static_pages/faq/faq.dart';
import 'package:e_commerce/features/static_pages/terms/terms.dart';
import 'package:e_commerce/features/whish_list/presentation/pages/wish_list.dart';
import 'package:go_router/go_router.dart';

import '../../features/introduction_screen/presentation/pages/introduction_screen.dart';

class PageRoutes {
  // static const String main = '/';
  static const String intro = '/introScreens';
  static const String signUpPage = '/signUp';
  static const String loginScreen = '/loginScreen';
  // static const String mainScreen = '/loginScreen/mainScreen';
  static const String mainScreen = '/';
  static const String productsDebendOnCategory =
      '/loginScreen/mainScreen/category/productsDebendOnCategory';
  static const String productListing =
      '/loginScreen/mainScreen/category/ProductListing';
  static const String searchScreen = '/loginScreen/mainScreen/searchScreen';
  static const String productDetatils = '/productDetatils';
  static const String cartScreen = '/productDetatils/cartScreen';
  static const String wishListScreen = '/wishList';
  static const String profileScreen = '/profile';
  static const String termsScreen = '/profile/termsScreen';
  static const String faqScreen = '/profile/faqScreen';
  static const String oldPass = '/profile/changeOldPass';
  static const String changePass = '/profile/changeNewPass';
  static const String categoryType = '/profile/categoryType';
  static const String categoryKind = '/profile/categoryKind';

  static GoRouter router = GoRouter(
    routes: [
      // GoRoute(
      //   path: main,
      //   builder: (context, state) => const SplashSCreen(),
      // ),
      GoRoute(
        path: intro,
        builder: (context, state) => const IntroductionScreens(),
      ),
      GoRoute(
        path: signUpPage,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: productsDebendOnCategory,
        builder: (context, state) {
          final name = state.extra as String;
          return CategorySubKindScreen(categoryName: name);
        },
      ),
      GoRoute(
        path: productListing,
        builder: (context, state) {
          final title = state.extra as String;
          return ProductListingScreen(
            title: title,
          );
        },
      ),
      GoRoute(
        path: searchScreen,
        builder: (context, state) {
          return const SearchScreen();
        },
      ),
      GoRoute(
        path: productDetatils,
        builder: (context, state) {
          return const ProdyuctDetail();
        },
      ),
      GoRoute(
        path: cartScreen,
        builder: (context, state) {
          return const MyCartScreen();
        },
      ),
      GoRoute(
        path: cartScreen,
        builder: (context, state) {
          return const WishListScreen();
        },
      ),
      GoRoute(
        path: profileScreen,
        builder: (context, state) {
          return const ProfileScreen();
        },
      ),
      GoRoute(
        path: termsScreen,
        builder: (context, state) {
          return const TermsAndConditions();
        },
      ),
      GoRoute(
        path: faqScreen,
        builder: (context, state) {
          return const FAQsScreen();
        },
      ),
      GoRoute(
        path: oldPass,
        builder: (context, state) {
          return const ChangeOldPassword();
        },
      ),
      GoRoute(
        path: changePass,
        builder: (context, state) {
          return const ChangeNewPassword();
        },
      ),
      GoRoute(
        path: categoryType,
        builder: (context, state) {
          return const MainAddProduct();
        },
      ),
      // GoRoute(
      //   path: categoryKind,
      //   builder: (context, state) {
      //     return const CategoryKind();
      //   },
      // ),
    ],
  );
}
