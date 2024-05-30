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
            bottomNavigationBar: customBottomNavigationBar(cubit),
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
      elevation: 5,
      backgroundColor: Colors.white,
      currentIndex: cubit.index,
      onTap: (value) => cubit.changeSpacess(value),
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
          label: 'الصفحة الرئيسية',
        ),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shapes), label: 'الانواع'),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartShopping), label: 'عربة التسوق'),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart), label: 'المفضلة'),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user), label: 'مركز المستخدم'),
      ],
    );
  }
}
