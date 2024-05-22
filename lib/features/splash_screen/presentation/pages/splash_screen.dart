import 'package:e_commerce/core/widgets/alesraa_logo.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routers.dart';

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen>
    with TickerProviderStateMixin {
  late Animation<double> fadeInOutAnimation;
  late AnimationController controller;
  @override
  void initState() {
    initialAnimation();
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).pushReplacement(PageRoutes.intro);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenWrapper(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AlesraaLogo(),
              FadeTransition(
                opacity: fadeInOutAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alesraa',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 60),
                    ),
                    Text(
                      ' appliance store',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initialAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    fadeInOutAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
    fadeInOutAnimation.addListener(() {
      setState(() {});
    });
    controller.forward();
  }
}
