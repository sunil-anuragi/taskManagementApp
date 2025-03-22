import 'package:flutter/material.dart';
import 'package:jewellery/common/widgets/text/custom_text.dart';
import 'package:jewellery/consts/app_text_style.dart';

class NoDataFound extends StatelessWidget {
  final String text;
  const NoDataFound({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text,
        style: AppTextStyle.semiBold16TextStyle,
      ),
    );
  }
}
