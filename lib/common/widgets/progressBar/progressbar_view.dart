import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';

class ProgressbarView extends StatelessWidget {
  final double value;
  const ProgressbarView({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 7,
      backgroundColor: AppColorConsts.borderColor.withOpacity(0.3),
      valueColor: const AlwaysStoppedAnimation<Color>(
        AppColorConsts.userBorderColor,
      ),
      borderRadius: BorderRadius.circular(50),
      value: value,
    );
  }
}
