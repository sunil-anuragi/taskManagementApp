import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';

class CommonBorderBoxView extends StatelessWidget {
  final Widget? child;
  final bool bottom;
  final Widget? bottomChild;
  const CommonBorderBoxView(
      {super.key, this.child, this.bottom = false, this.bottomChild});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColorConsts.userBorderColor),
          ),
          child: child ?? const SizedBox(),
        ),
      ],
    );
  }
}
