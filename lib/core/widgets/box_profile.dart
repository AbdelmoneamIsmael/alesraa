import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';

class BoxProfile extends StatelessWidget {
  const BoxProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(12),
          color: AppColors.blackColor,
        ),
        child: Center(
          child: Text(
            'A I',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
