import 'package:flutter/material.dart';
import 'package:jewellery/common/widgets/text/custom_text.dart';
import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:jewellery/consts/extensions.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  const FloatingActionButtonWidget(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(title,
            style: AppTextStyle.regular12TextStyle
                .copyWith(color: AppColorConsts.hintStyleColor)),
        10.hs,
        FloatingActionButton(
          backgroundColor: AppColorConsts.yellowColor,
          onPressed: () {
            onTap();
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: AppColorConsts.whiteColor,
          ),
        ),
      ],
    );
  }
}
