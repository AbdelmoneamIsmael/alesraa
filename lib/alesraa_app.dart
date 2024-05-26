import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/cubit/cubit/app_cubit.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/utilies/them_data_file.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/create_create_product/cubit/create_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlesraaApp extends StatelessWidget {
  const AlesraaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Spaces.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => CreateProductCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: PageRoutes.router,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
      ),
    );
  }
}
