import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(
                child: CustomAppBar(
              title: 'FAQs',
            )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(Spaces.height16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Can I cancel my order?',
                    style: AppTextStyle.medium,
                  ),
                  Text(
                    'Yes only if the order is not dispatched yet. You can contact our customer service department to get your order canceled.',
                    style: AppTextStyle.captionStyle12.copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    'Will I receive the same product I see in the photo?',
                    style: AppTextStyle.medium,
                  ),
                  Text(
                    'Actual product color may vary from the images shown. Every monitor or mobile display has a different capability to display colors, and every individual may see these colors differently. In addition, lighting conditions at the time the photo was taken can also affect an image\'s color.',
                    style: AppTextStyle.captionStyle12.copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    'How can I recover the forgotten password?',
                    style: AppTextStyle.medium,
                  ),
                  Text(
                    'If you have forgotten your password, you can recover it from "Login - Forgotten your password?" section. You will receive an e-mail with a link to enter and confirm your new password.',
                    style: AppTextStyle.captionStyle12.copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    'Is my personal information confidential?',
                    style: AppTextStyle.medium,
                  ),
                  Text(
                    'Your personal information is confidential. We do not rent, sell, barter or trade email addresses. When you place an order with us, we collect your name, address, telephone number, credit card information and your email address. We use this information to fulfill your order and to communicate with you about your order. All your information is kept confidential and will not be disclosed to anybody unless ordered by government authorities.',
                    style: AppTextStyle.captionStyle12.copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    'What payment methods can I use to make purchases?',
                    style: AppTextStyle.medium,
                  ),
                  Text(
                    'We offer the following payment methods: PayPal, VISA, MasterCard and Voucher code, if applicable.',
                    style: AppTextStyle.captionStyle12.copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _space() => SizedBox(
        height: Spaces.height20,
      );
}
