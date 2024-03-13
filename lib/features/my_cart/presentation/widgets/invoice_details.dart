import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:flutter/material.dart';

class IvoiceDetails extends StatelessWidget {
  const IvoiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Spaces.height16),
      width: double.infinity,
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Text(
            'Order Info',
            style: AppTextStyle.textMedium().copyWith(fontSize: 16),
          ),
          _space(),
          _space(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: AppTextStyle.captionStyle(),
              ),
              Text(
                '\$ 200.00',
                style: AppTextStyle.captionStyle(),
              ),
            ],
          ),
          _space(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Cost',
                style: AppTextStyle.captionStyle(),
              ),
              Text(
                '\$ 200.00',
                style: AppTextStyle.captionStyle(),
              ),
            ],
          ),
          _space(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'total',
                style: AppTextStyle.textMedium().copyWith(fontSize: 16),
              ),
              Text(
                '\$ 200.00',
                style: AppTextStyle.textMedium().copyWith(fontSize: 16),
              ),
            ],
          ),
          _space(),
          _space(),
          _space(),
          PrimeButtom(text: 'Cheeck out (5)', onTap: () {}),
        ],
      ),
    );
  }

  SizedBox _space() => SizedBox(
        height: Spaces.height8,
      );
}
