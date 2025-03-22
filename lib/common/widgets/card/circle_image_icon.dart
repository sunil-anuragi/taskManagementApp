import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleImageIcon extends StatelessWidget {
  final String image;
  final Color? backgroundColor;
  final double? imageSize;
  final double? radius;

  final ColorFilter? imageColor;

  const CircleImageIcon({
    super.key,
    required this.image,
    this.backgroundColor,
    this.imageSize,
    this.radius,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? AppColorConsts.lightBlueColor,
      child: SvgPicture.asset(
        image,
        colorFilter: imageColor,
        height: imageSize ?? 20,
      ),
    );
  }
}
