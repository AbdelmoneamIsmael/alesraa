import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/cubit/cubit/app_cubit.dart';
import 'package:e_commerce/core/helper/bloc_observer.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/utilies/them_data_file.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(
    const MyApp(),

    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Spaces.init(context);
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp.router(
        routerConfig: PageRoutes.router,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
      ),
    );
  }
}
