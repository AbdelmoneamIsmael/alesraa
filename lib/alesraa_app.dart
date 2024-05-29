import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/cubit/cubit/app_cubit.dart';
import 'package:e_commerce/core/routes/page_routers.dart';
import 'package:e_commerce/core/utilies/them_data_file.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/create_create_product/cubit/create_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AlesraaApp extends StatelessWidget {
  const AlesraaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Spaces.init(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
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
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", "AE"),
        ],
        routerConfig: PageRoutes.router,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
      ),
    );
  }
}
