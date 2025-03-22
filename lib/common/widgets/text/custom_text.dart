import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final double fontSize;
  final EdgeInsetsGeometry? padding;
  final String? fontFamily;

  const CustomText(
    this.text, {
    this.style,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.fontWeight,
    this.fontColor,
    this.fontSize = 14,
    super.key,
    this.padding,
    this.fontFamily,
  });

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: style ??
            AppTextStyle.medium14TextStyle.copyWith(
              color: fontColor ?? AppColorConsts.blackColor,
              fontSize: fontSize,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
