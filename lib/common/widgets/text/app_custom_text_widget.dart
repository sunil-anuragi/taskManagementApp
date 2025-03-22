import 'package:flutter/material.dart';

class AppCustomTextWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color titleColor;
  final FontWeight fontWeight;
  final String fontFamily;

  const AppCustomTextWidget(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.titleColor,
      required this.fontWeight,
      required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: titleColor),
      textAlign: TextAlign.center,
    );
  }
}
