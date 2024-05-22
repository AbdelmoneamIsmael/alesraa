import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/features/main_screen/presentation/manger/cubit.dart';
import 'package:e_commerce/features/main_screen/presentation/manger/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: BlocConsumer<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          var cubit = MainScreenCubit.get(context);
          return ScreenWrapper(
            bottomNavigationBar: SizedBox(
              height: 65,
              child: customBottomNavigationBar(cubit),
            ),
            body:
                BlocProvider.of<MainScreenCubit>(context).screens[cubit.index],
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  BottomNavigationBar customBottomNavigationBar(MainScreenCubit cubit) {
    return BottomNavigationBar(
      currentIndex: cubit.index,
      onTap: (value) => cubit.changeSpacess(value),
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shapes), label: 'Category'),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartShopping), label: 'MyCart'),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart), label: 'WishList'),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user), label: 'Profile'),
      ],
    );
  }
}
