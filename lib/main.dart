import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/alesraa_app.dart';
import 'package:e_commerce/core/helper/bloc_observer.dart';
import 'package:e_commerce/core/utilies/functions.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  getAllCategoryAllocator();
  Bloc.observer = MyBlocObserver();
  runApp(
    // const AlesraaApp(),

    DevicePreview(
      enabled: true,
      builder: (context) => const AlesraaApp(), // Wrap your app
    ),
  );
}
