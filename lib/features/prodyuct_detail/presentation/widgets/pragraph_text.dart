import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/cupertino.dart';

class ParagraphText extends StatefulWidget {
  const ParagraphText(
      {super.key, required this.text, required this.textHeight});
  final String text;
  final int textHeight;

  @override
  State<ParagraphText> createState() => _ParagraphTextState();
}

class _ParagraphTextState extends State<ParagraphText> {
  bool isHalf = true;
  late String firstText;
  late String secondText;
  @override
  void initState() {
    super.initState();
    if (widget.text.length <= widget.textHeight) {
      firstText = widget.text;
      secondText = "";
    } else {
      firstText = widget.text.substring(0, widget.textHeight);
      secondText =
          widget.text.substring(widget.textHeight + 1, widget.text.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Spaces.height16),
      child: secondText.isEmpty
          ? _text(string: firstText)
          : isHalf
              ? GestureDetector(
                  onTap: () => setState(() {
                    isHalf = !isHalf;
                  }),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$firstText...  ',
                          style: AppTextStyle.regular14
                              .copyWith(height: 1.2, color: AppColors.grey150),
                        ),
                        WidgetSpan(child: _linkText(text: 'Read More'))
                      ],
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () => setState(() {
                    isHalf = !isHalf;
                  }),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$firstText $secondText',
                          style: AppTextStyle.regular14
                              .copyWith(height: 1.2, color: AppColors.grey150),
                        ),
                        WidgetSpan(child: _linkText(text: 'Read Less'))
                      ],
                    ),
                  ),
                ),
    );
  }

  CupertinoButton _linkText({required String text}) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Text(
        text,
        style: AppTextStyle.regular14
            .copyWith(color: AppColors.cyanColor, height: 1.5),
      ),
      onPressed: () {
        setState(() {
          isHalf = !isHalf;
        });
      },
    );
  }

  Text _text({required String string}) => Text(
        string,
        style: AppTextStyle.regular14
            .copyWith(height: 1.5, color: AppColors.grey150),
      );
}
