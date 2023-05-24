import 'package:flutter/material.dart';

import '../const/text_styles.dart';

// ignore: must_be_immutable
class XyTextButton extends StatelessWidget {
  XyTextButton(
      {Key? key, required this.onPressed, required this.text, this.textStyle})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: textStyle ?? XiaoyanTextStyle().mainTabText,
      ),
    );
  }
}
