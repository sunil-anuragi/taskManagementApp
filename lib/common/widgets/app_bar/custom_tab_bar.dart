import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? controller;
  final List<Widget> tabs;

  const CustomTabBar({
    super.key,
    this.controller,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorColor: AppColorConsts.whiteColor,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: AppColorConsts.whiteColor.withOpacity(0.8),
      labelColor: AppColorConsts.whiteColor,
      tabs: tabs,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
