import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';

class AppCardView extends StatelessWidget {
  final Widget? child;
  const AppCardView({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorConsts.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5,
      child: child,
    );
  }
}
