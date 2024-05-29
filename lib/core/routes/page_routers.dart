import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/features/Profile/presentation/pages/profile.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_broduct_image.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_kind_landing.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_category_type.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_product_numbers.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_product_text.dart';
import 'package:e_commerce/features/change_password/presentation/pages/change_new_password.dart';
import 'package:e_commerce/features/change_password/presentation/pages/change_password.dart';
import 'package:e_commerce/features/edit_product/presentation/screens/edit_product_screen.dart';
import 'package:e_commerce/features/main_screen/presentation/screens/main_screen.dart';
import 'package:e_commerce/features/my_cart/presentation/pages/my_cart_screen.dart';
import 'package:e_commerce/features/product_listing/domain/entities/product_entity.dart';
import 'package:e_commerce/features/product_listing/presentation/pages/product_listing_screen.dart';
import 'package:e_commerce/features/products_related_to_category/presentation/pages/products_debend_on_category.dart';
import 'package:e_commerce/features/product_detail/presentation/pages/product_detail.dart';
import 'package:e_commerce/features/search_screen/presentation/pages/search_screen.dart';
import 'package:e_commerce/features/sign_up_login/presentation/pages/sign_in_screen.dart';
import 'package:e_commerce/features/sign_up_login/presentation/pages/sign_up.dart';
import 'package:e_commerce/features/static_pages/faq/faq.dart';
import 'package:e_commerce/features/static_pages/terms/terms.dart';
import 'package:e_commerce/features/whish_list/presentation/pages/wish_list.dart';
import 'package:go_router/go_router.dart';

import 'package:e_commerce/features/introduction_screen/presentation/pages/introduction_screen.dart';

class PageRoutes {
  static GoRouter router = GoRouter(
    routes: [
      // GoRoute(
      //   path: main,
      //   builder: (context, state) => const SplashSCreen(),
      // ),
      GoRoute(
        path: Routes.intro,
        builder: (context, state) => const IntroductionScreens(),
      ),
      GoRoute(
        path: Routes.signUpPage,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: Routes.loginScreen,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: Routes.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: Routes.productsDebendOnCategory,
        builder: (context, state) {
          final name = state.extra as String;
          return CategorySubKindScreen(categoryName: name);
        },
      ),
      GoRoute(
        path: Routes.productListing,
        builder: (context, state) {
          final title = state.extra as String;
          return ProductListingScreen(
            title: title,
          );
        },
      ),
      GoRoute(
        path: Routes.searchScreen,
        builder: (context, state) {
          return const SearchScreen();
        },
      ),
      GoRoute(
        path: Routes.productDetatils,
        builder: (context, state) {
          ProductEntity productEntity = state.extra as ProductEntity;
          return ProdyuctDetail(
            productEntity: productEntity,
          );
        },
      ),
      GoRoute(
        path: Routes.cartScreen,
        builder: (context, state) {
          return const MyCartScreen();
        },
      ),
      GoRoute(
        path: Routes.cartScreen,
        builder: (context, state) {
          return const WishListScreen();
        },
      ),
      GoRoute(
        path: Routes.profileScreen,
        builder: (context, state) {
          return const ProfileScreen();
        },
      ),
      GoRoute(
        path: Routes.termsScreen,
        builder: (context, state) {
          return const TermsAndConditions();
        },
      ),
      GoRoute(
        path: Routes.faqScreen,
        builder: (context, state) {
          return const FAQsScreen();
        },
      ),
      GoRoute(
        path: Routes.oldPass,
        builder: (context, state) {
          return const ChangeOldPassword();
        },
      ),
      GoRoute(
        path: Routes.changePass,
        builder: (context, state) {
          return const ChangeNewPassword();
        },
      ),
      GoRoute(
        path: Routes.categoryType,
        builder: (context, state) {
          return const CategoryType();
        },
      ),
      GoRoute(
        path: Routes.addCategoryKind,
        builder: (context, state) {
          AddProductCategoryModel model =
              state.extra as AddProductCategoryModel;
          return CategoryKind(
            categoryModel: model,
          );
        },
      ),
      GoRoute(
        path: Routes.createProductTexts,
        builder: (context, state) {
          Map<String, dynamic> model = state.extra as Map<String, dynamic>;

          return ProductText(
            categoryModel: model["categoryModel"],
            kindModel: model["kindModel"],
          );
        },
      ),
      GoRoute(
        path: Routes.createProductNumber,
        builder: (context, state) {
          return const ProductNumbers();
        },
      ),
      GoRoute(
        path: Routes.createProductImage,
        builder: (context, state) {
          return const ProductImage();
        },
      ),
      GoRoute(
        path: Routes.editProduct,
        builder: (context, state) {
          ProductEntity productEntity = state.extra as ProductEntity;
          return EditProductScreen(
            productEntity: productEntity,
          );
        },
      ),
    ],
  );
}
