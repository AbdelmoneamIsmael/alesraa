import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/utilies/them_data_file.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MyApp(),
      // DevicePreview(
      //   enabled: true,
      //   builder: (context) => const MyApp(), // Wrap your app
      // ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Spaces.init(context);
    return MaterialApp.router(
      routerConfig: PageRoutes.router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
    );
  }
}
