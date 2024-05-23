import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.color = AppColors.cyanColor,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(color: color);
  }
}
