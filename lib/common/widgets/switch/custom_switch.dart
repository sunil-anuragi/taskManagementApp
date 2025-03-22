import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: AppColorConsts.lightBlueD1Color.withOpacity(0.2),
      inactiveThumbColor: AppColorConsts.greyCDColor.withOpacity(0.2),
      inactiveTrackColor: AppColorConsts.greyCDColor,
      thumbColor: WidgetStatePropertyAll(value
          ? AppColorConsts.lightBlueD1Color
          : AppColorConsts.whiteColor),
      trackOutlineColor:
          const WidgetStatePropertyAll(AppColorConsts.transparentColor),
      value: value,
      onChanged: onChanged,
      activeTrackColor: AppColorConsts.lightBlueF9Color,
    );
  }
}
