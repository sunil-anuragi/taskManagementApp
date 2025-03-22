import 'package:jewellery/common/widgets/text/custom_text.dart';
import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? customerTitle;
  final String title;
  final Color backGroundColor;
  final Color backIconColor;

  final TextStyle? titleTextStyle;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final List<Widget> actions;
  final VoidCallback? onLeadingTap;
  final Function(int)? onActionTap;
  final PreferredSizeWidget? bottom;

  const GlobalAppBar({
    super.key,
    this.leading,
    required this.title,
    this.titleTextStyle,
    this.backGroundColor = AppColorConsts.transparentColor,
    this.backIconColor = AppColorConsts.whiteColor,
    this.centerTitle = false,
    this.automaticallyImplyLeading = false,
    this.actions = const [],
    this.onLeadingTap,
    this.onActionTap,
    this.bottom, this.customerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // titleTextStyle: AppTextStyle.bold20TextStyle.copyWith(color: AppColorConsts.blackColor),
      // centerTitle: true,
      // title: Text(title,style: AppTextStyle.bold20TextStyle,),
      // backgroundColor: AppColorConsts.transparentColor,
      bottom: bottom,
      titleTextStyle: titleTextStyle ??
          AppTextStyle.bold20TextStyle
              .copyWith(color: AppColorConsts.blackColor),
      centerTitle: centerTitle,
      title: customerTitle ?? CustomText(
        title,
        fontSize: 16,
        style: titleTextStyle,
        // fontColor: AppColorConsts.whiteColor,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      iconTheme: IconThemeData(color: backIconColor),
      backgroundColor: backGroundColor,
      elevation: 0,
      titleSpacing: 0,
      leading: leading != null && onLeadingTap != null
          ? GestureDetector(
              onTap: onLeadingTap,
              child: leading,
            )
          : null,
      actions: actions.asMap().entries.map((entry) {
        final index = entry.key;
        final action = entry.value;
        return GestureDetector(
          onTap: () {
            if (onActionTap != null) {
              onActionTap!(index);
            }
          },
          child: action,
        );
      }).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
