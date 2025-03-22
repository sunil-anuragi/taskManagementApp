import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';

/// A beautiful and animated bottom navigation that paints a rounded shape
/// around its [items] to provide a wonderful look.
///
/// Update [selectedIndex] to change the selected item.
/// [selectedIndex] is required and must not be null.
class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.shadowColor = Colors.black12,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.blurRadius = 2,
    this.spreadRadius = 0,
    this.borderRadius,
    this.shadowOffset = Offset.zero,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 4),
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.showInactiveTitle = false,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  }) : assert(items.length >= 2 && items.length <= 5);

  /// The selected item is index. Changing this property will change and animate
  /// the item being selected. Defaults to zero.
  final int selectedIndex;

  /// The icon size of all items. Defaults to 24.
  final double iconSize;

  /// The background color of the navigation bar. It defaults to
  /// [ThemeData.BottomAppBarTheme.color] if not provided.
  final Color? backgroundColor;

  /// Defines the shadow color of the navigation bar. Defaults to [Colors.black12].
  final Color shadowColor;

  /// Whether this navigation bar should show a elevation. Defaults to true.
  final bool showElevation;

  /// Use this to change the item's animation duration. Defaults to 270ms.
  final Duration animationDuration;

  /// Defines the appearance of the buttons that are displayed in the bottom
  /// navigation bar. This should have at least two items and five at most.
  final List<BottomNavyBarItem> items;

  /// A callback that will be called when a item is pressed.
  final ValueChanged<int> onItemSelected;

  /// Defines the alignment of the items.
  /// Defaults to [MainAxisAlignment.spaceBetween].
  final MainAxisAlignment mainAxisAlignment;

  /// The [items] corner radius, if not set, it defaults to 50.
  final double itemCornerRadius;

  /// Defines the bottom navigation bar height. Defaults to 56.
  final double containerHeight;

  /// Used to configure the blurRadius of the [BoxShadow]. Defaults to 2.
  final double blurRadius;

  /// Used to configure the spreadRadius of the [BoxShadow]. Defaults to 0.
  final double spreadRadius;

  /// Used to configure the offset of the [BoxShadow]. Defaults to null.
  final Offset shadowOffset;

  /// Used to configure the borderRadius of the [CustomBottomBar]. Defaults to null.
  final BorderRadiusGeometry? borderRadius;

  /// Used to configure the padding of the [BottomNavyBarItem] [items].
  /// Defaults to EdgeInsets.symmetric(horizontal: 4).
  final EdgeInsets itemPadding;

  /// Used to configure the animation curve. Defaults to [Curves.linear].
  final Curve curve;

  /// Whether this navigation bar should show a Inactive titles. Defaults to false.
  final bool showInactiveTitle;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ??
        (Theme.of(context).bottomAppBarTheme.color ?? Colors.white);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(52)),
            color: AppColorConsts.primaryColor,
            boxShadow: [
              BoxShadow(
                color: AppColorConsts.blackColor.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 56,
                offset: const Offset(0, 14),
              ),
            ]),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => onItemSelected(index),
                  child: _ItemWidget(
                    item: item,
                    iconSize: iconSize,
                    isSelected: index == selectedIndex,
                    backgroundColor: bgColor,
                    itemCornerRadius: itemCornerRadius,
                    animationDuration: animationDuration,
                    itemPadding: itemPadding,
                    curve: curve,
                    index: index,
                    selectedIndex: selectedIndex,
                    showInactiveTitle: showInactiveTitle,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final EdgeInsets itemPadding;
  final Curve curve;
  final bool showInactiveTitle;
  final int index;
  final int selectedIndex;

  const _ItemWidget({
    required this.iconSize,
    required this.isSelected,
    required this.item,
    required this.backgroundColor,
    required this.itemCornerRadius,
    required this.animationDuration,
    required this.itemPadding,
    required this.showInactiveTitle,
    required this.index,
    required this.selectedIndex,
    this.curve = Curves.linear,
  });

  @override
  Widget build(BuildContext context) {
    Semantics semantic = Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: DefaultTextStyle.merge(
            style: AppTextStyle.medium14TextStyle
                .copyWith(color: AppColorConsts.whiteColor),
            textAlign: item.textAlign,
            overflow: TextOverflow.ellipsis,
            child: index != selectedIndex ? item.icon : item.activeiIcon,
          ),
        ),
      ),
    );
    return item.tooltipText == null
        ? semantic
        : Tooltip(
            message: item.tooltipText!,
            child: semantic,
          );
  }
}

/// The [CustomBottomBar.items] definition.
class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    required this.activeiIcon,
    required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
    this.activeTextColor,
    this.activeBackgroundColor,
    this.tooltipText,
  });

  /// Defines this item's icon which is placed in the right side of the [title].
  final Widget icon;

  /// Defines this selected item's .
  final Widget activeiIcon;

  /// Defines this item's title which placed in the left side of the [icon].
  final Widget title;

  /// The [icon] and [title] color defined when this item is selected. Defaults
  /// to [Colors.blue].
  final Color activeColor;

  /// The [icon] and [title] color defined when this item is not selected.
  final Color? inactiveColor;

  /// The alignment for the [title].
  ///
  /// This will take effect only if [title] it a [Text] widget.
  final TextAlign? textAlign;

  /// The [title] color with higher priority than [activeColor]
  ///
  /// Will fallback to [activeColor] when null
  final Color? activeTextColor;

  /// The [BottomNavyBarItem] background color when active.
  ///
  /// Will fallback to [activeColor] with opacity 0.2 when null
  final Color? activeBackgroundColor;

  /// Will show a tooltip for the item if provided.
  final String? tooltipText;
}
