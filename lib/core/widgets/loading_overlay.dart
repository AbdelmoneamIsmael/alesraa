import 'dart:ui';

import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4,
        sigmaY: 4,
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withOpacity(0.65),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}
