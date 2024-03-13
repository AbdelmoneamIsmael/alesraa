import 'package:e_commerce/features/Profile/presentation/pages/profile.dart';
import 'package:e_commerce/features/category_screen/presentation/pages/categorey_screen.dart';
import 'package:e_commerce/features/home_screen/presentation/pages/home_screen.dart';
import 'package:e_commerce/features/main_screen/presentation/manger/state.dart';
import 'package:e_commerce/features/my_cart/presentation/pages/my_cart_screen.dart';
import 'package:e_commerce/features/whish_list/presentation/pages/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(InitialMainState());
  static MainScreenCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const MyCartScreen(),
    const WishListScreen(),
    const ProfileScreen(),
  ];

  int index = 0;
  void changeSpacess(int currentSpaces) {
    index = currentSpaces;
    emit(ChangeBottomNavigationBrState());
  }
}
