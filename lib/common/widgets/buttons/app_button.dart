import 'package:jewellery/common/widgets/text/custom_text.dart';
import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:jewellery/consts/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonName,
    required this.onTap,
    this.prefixIcon,
    this.isDisabled = false,
    this.textColor = AppColorConsts.whiteColor,
    this.backgroundColor = AppColorConsts.deepSkyColor,
    this.borderColor = AppColorConsts.transparentColor,
    this.loading = false,
    this.txtStyle,
    this.radius,
    this.isshadow = true,
    this.height = 45.0,
    this.padding,
    this.prefixIconColor = AppColorConsts.whiteColor,
    this.loaderColor = Colors.white,
  });

  final String buttonName;
  final VoidCallback onTap;
  final bool isDisabled;
  final Color textColor;
  final Color prefixIconColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color loaderColor;
  final String? prefixIcon;
  final bool? loading;
  final TextStyle? txtStyle;
  final double? radius;
  final double? height;
  final bool isshadow;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: height,
        decoration: BoxDecoration(
            color: isDisabled
                ? AppColorConsts.boxBackgroundColor
                : backgroundColor,
            borderRadius: BorderRadius.circular(radius ?? 12),
            boxShadow: isshadow
                ? const [
                    BoxShadow(
                      color: AppColorConsts.dropShadowColor,
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ]
                : [],
            border: Border.all(width: 1, color: borderColor)),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              prefixIcon != null
                  ? SvgPicture.asset(
                      prefixIcon!,
                      width: 20,
                      height: 20,
                      color: prefixIconColor,
                    )
                  : const SizedBox.shrink(),
              10.hs,
              loading == true
                  ? CircularProgressIndicator(
                      color: loaderColor,
                    )
                  : CustomText(
                      buttonName,
                      style: txtStyle ??
                          AppTextStyle.semiBold16TextStyle.copyWith(
                            color: textColor,
                          ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
