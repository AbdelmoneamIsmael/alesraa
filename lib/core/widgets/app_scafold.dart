import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/cubit/cubit/app_cubit.dart';
import 'package:e_commerce/core/cubit/cubit/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    super.key,
    required this.body,
    this.statusAppBarColor,
    this.backGroundColor,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar,
    this.floatingActionButton,
    this.onWillPop,
    this.appBar,
    this.bottomNavigationBar,
  });

  final Widget body;
  final Color? statusAppBarColor;
  final Color? backGroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBodyBehindAppBar;
  final Widget? floatingActionButton;
  final bool? onWillPop;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: onWillPop ?? true,
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = BlocProvider.of<AppCubit>(context);
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: Scaffold(
                bottomNavigationBar: bottomNavigationBar,
                appBar: appBar,
                floatingActionButton: floatingActionButton,
                extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
                backgroundColor: backGroundColor ?? AppColor.backGroundColor,
                // AppColors.backGroundColor,
                // (cubit.color == 0
                //     ? AppColors.brown50
                //     : AppColors.backGroundColor),
                body: AnnotatedRegion(
                  value: SystemUiOverlayStyle(
                    statusBarColor:
                        statusAppBarColor ?? AppColor.backGroundColor,
                    // (cubit.color == 0
                    //     ? AppColors.brown50
                    //     : AppColors.backGroundColor),
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  child: SafeArea(
                    left: false,
                    bottom: false,
                    right: false,
                    child: body,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
