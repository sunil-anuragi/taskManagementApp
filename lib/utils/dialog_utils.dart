import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static BuildContext? context;

  static void showInSnackBar({
    required String message,
    required BuildContext context,
    Color? backgroundColor,
    Color? messageColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      // backgroundColor: backgroundColor,
      elevation: 8,
    ));
  }

  static void showCustomDialog({
    BuildContext? context,
    String? title,
    bool isDismissible = true,
    String? contentMessage,
    String? positiveButtonText,
    String? negativeButtonText,
    bool? isBackFromGesture,
    Color? negativeButtonColor = AppColorConsts.primaryColor,
    Color? positiveButtonColor = AppColorConsts.blackColor,
    Color? negativeBackgroundButtonColor = AppColorConsts.primaryColor,
    Color? positiveBackgroundButtonColor = AppColorConsts.secondaryColor,
    Function()? onPositivePressed,
    Function()? onNegativePressed,
  }) {
    showDialog(
      context: context!,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return PopScope(
          canPop: isBackFromGesture ?? true,// Needs to be replaced with new updates
          child: AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
            title: Text(title ?? ''),
            insetPadding: const EdgeInsets.symmetric(horizontal: 50),
            actionsPadding: const EdgeInsets.only(right: 20, bottom: 14),
            content: Builder(
              builder: (context) {
                var width = MediaQuery.of(context).size.width;
                return SizedBox(
                  width: width,
                  child: Text(contentMessage ?? ''),
                );
              },
            ),
            actions: [
              FilledButton(
                onPressed: onNegativePressed,
                style: ElevatedButton.styleFrom(backgroundColor: negativeBackgroundButtonColor?.withOpacity(0.2)),
                child: Text(negativeButtonText ?? '', style: AppTextStyle.medium14TextStyle.copyWith(color: negativeButtonColor)),
              ),
              FilledButton(
                onPressed: onPositivePressed,
                style: ElevatedButton.styleFrom(backgroundColor: positiveBackgroundButtonColor?.withOpacity(0.1)),
                child: Text(positiveButtonText ?? '', style: AppTextStyle.medium14TextStyle.copyWith(color: positiveButtonColor)),
              ),
            ],
          ),
        );
      },
    );
  }
}
