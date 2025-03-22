import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:jewellery/consts/extensions.dart';
import 'package:flutter/material.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'network_error_title',
              style: AppTextStyle.bold16TextStyle.copyWith(color: AppColorConsts.blackColor),
            ),
            32.vs,
            Text(
              'network_error_desc',
              style: AppTextStyle.medium14TextStyle.copyWith(color: AppColorConsts.blackColor),
            )
          ],
        ),
      ),
    );
  }
}