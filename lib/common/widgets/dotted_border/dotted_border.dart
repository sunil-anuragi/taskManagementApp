import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedBorderwidget extends StatelessWidget {
  final Color borderColor;
  final Widget child;
  final List<double> dashpattern;
  final double borderRadius;
  const DottedBorderwidget(
      {super.key,
      required this.borderColor,
      required this.child,
      required this.dashpattern,  this.borderRadius=10});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        borderType: BorderType.RRect,
        radius:  Radius.circular(borderRadius),
         padding : const EdgeInsets.all(1),
        strokeCap : StrokeCap.round,
        color: borderColor,
        strokeWidth: 2,
        dashPattern: dashpattern,
        child: child);
  }
}
