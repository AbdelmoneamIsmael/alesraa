import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/cupertino.dart';

class Quantity extends StatefulWidget {
  const Quantity(
      {super.key,
      required this.count,
      required this.onMinusTap,
      required this.onPlusTap});
  final int count;
  final void Function()? onMinusTap;
  final void Function()? onPlusTap;
  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: UnconstrainedBox(
        child: Container(
          width: Spaces.width * .2666,
          padding: EdgeInsets.all(Spaces.height8),
          // margin: EdgeInsets.symmetric(horizontal: Spaces.width16),
          decoration: BoxDecoration(
            border: const Border.fromBorderSide(
                BorderSide(color: AppColors.grey50)),
            borderRadius: BorderRadius.all(Radius.circular(Spaces.height8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: widget.onMinusTap,
                child: Text(
                  '-',
                  style: AppTextStyle.textSemiBold(),
                ),
              ),
              Text(
                widget.count.toString(),
                style: AppTextStyle.textSemiBold(),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: widget.onMinusTap,
                child: Text(
                  '+',
                  style: AppTextStyle.textSemiBold(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
