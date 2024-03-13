import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';

import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(child: CustomAppBar(title: 'Terms & Condition')),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(Spaces.height16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms & Conditions',
                    style: AppTextStyle.headerBold().copyWith(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: Spaces.height10,
                  ),
                  Text(
                    'Welcome to Alessra! These Terms and Conditions ("Terms") govern your use of our e-commerce app. By accessing or using Alesraa, you agree to be bound by these Terms. Please read them carefully before proceeding',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    '1. Account Registration:',
                    style: AppTextStyle.textMedium(),
                  ),
                  Text(
                    '- You must create an account to use certain features of Alesraa.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  Text(
                    '- You are responsible for providing accurate and up-to-date information during the registration process.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  Text(
                    '- You must safeguard your account credentials and notify us immediately of any unauthorized access or use of your account. ',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    '2. Product Information and Pricing:',
                    style: AppTextStyle.textMedium(),
                  ),
                  Text(
                    '- Alesraa strives to provide accurate product descriptions, images, and pricing information.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  Text(
                    ' - We reserve the right to modify product details and prices without prior notice. ',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  Text(
                    ' - In the event of an error, we may cancel or refuse orders placed for incorrectly priced products.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    '3. Order Placement and Fulfillment:',
                    style: AppTextStyle.textMedium(),
                  ),
                  Text(
                    ' - By placing an order on Alesraa, you agree to purchase the selected products at the stated price.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  Text(
                    ' - We reserve the right to accept or reject any order, and we may cancel orders due to product unavailability, pricing errors, or suspected fraudulent activity.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  Text(
                    ' - Once an order is confirmed, we will make reasonable efforts to fulfill and deliver it in a timely manner.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    '4. Payment:',
                    style: AppTextStyle.textMedium(),
                  ),
                  Text(
                    ' - Alesraa supports various payment methods, including credit/debit cards and online payment platforms. ',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  Text(
                    '  - By providing payment information, you represent and warrant that you are authorized to use the chosen payment method.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  Text(
                    '  - All payments are subject to verification and approval by relevant financial institutions.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    '5. Shipping and Delivery:',
                    style: AppTextStyle.textMedium(),
                  ),
                  Text(
                    '     - Alesraa will make reasonable efforts to ensure timely delivery of products.\n- Shipping times may vary based on factors beyond our control, such as location, weather conditions, or carrier delays.\n- Risk of loss or damage to products passes to you upon delivery.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    '6. Returns and Refunds:',
                    style: AppTextStyle.textMedium(),
                  ),
                  Text(
                    ' - Alesraa\'s return and refund policies are outlined separately and govern the process for returning products and seeking refunds.\n- Certain products may be non-returnable or subject to specific conditions.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    '7. Intellectual Property:',
                    style: AppTextStyle.textMedium(),
                  ),
                  Text(
                    '- Alesraa and its content, including logos, trademarks, text, images, and software, are protected by intellectual property rights.\n- You may not use, reproduce, modify, distribute, or display any part of Alesraa without our prior written consent.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    '8. User Conduct:',
                    style: AppTextStyle.textMedium(),
                  ),
                  Text(
                    '  - You agree to use Alesraa in compliance with applicable laws and regulations.\n- You will not engage in any activity that disrupts or interferes with the functioning of Alesraa or infringes upon the rights of others.\n- Any unauthorized use or attempt to access restricted areas or user accounts is strictly prohibited.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    ' 9. Limitation of Liability:',
                    style: AppTextStyle.textMedium(),
                  ),
                  Text(
                    '   - Alesraa and its affiliates shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising from the use or inability to use our app or any products purchased through it.\n- We do not guarantee the accuracy, completeness, or reliability of information provided on Alesraa.',
                    style: AppTextStyle.captionStyle().copyWith(
                      color: AppColors.grey150,
                    ),
                  ),
                  _space(),
                  Text(
                    '10. Governing Law:',
                    style: AppTextStyle.textMedium(),
                  ),
                  Text(
                    '     - These Terms shall be governed by and construed in accordance with the laws of [Jurisdiction].\n- Any disputes arising out of or relating to these Terms shall be resolved in the courts of [Jurisdiction].',
                    style: AppTextStyle.captionStyle().copyWith(
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
