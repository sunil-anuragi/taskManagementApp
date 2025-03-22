import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jewellery/consts/color_consts.dart';

Future<DateTime?> getDateFunction({
  required BuildContext context,
  bool isOnlyFuture = false,
  bool isOldDate = false,
  bool isForAge = false,
}) async {
  if (kDebugMode) {
    print(isOnlyFuture ? DateTime.now() : DateTime(1900));
  }
  return await showDatePicker(
    context: context,
    initialDate: isForAge
        ? DateTime.now().subtract(const Duration(days: 16 * 365))
        : DateTime.now(),
    firstDate: isOnlyFuture
        ? DateTime.now()
        : DateTime(
            1900), // DateTime.now() - not to allow to choose before today.
    lastDate: isOldDate
        ? DateTime.now()
        : isForAge
            ? DateTime.now().subtract(const Duration(days: 16 * 365))
            : DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColorConsts.primaryColor, // Header background color
            onPrimary: AppColorConsts.whiteColor, // Header text color
            onSurface: AppColorConsts.blackColor, // Dates text color
          ),
          dialogBackgroundColor: AppColorConsts.containerBgColor
              .withOpacity(0.5), // Dialog background color
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColorConsts.primaryColor, // Button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );
}

Future<DateTime?> getValidDateDialog({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime startDate,
  required DateTime lastDate,
}) async {
  return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: startDate,
      lastDate: lastDate);
}

Future<TimeOfDay?> getTimeFunction({
  required BuildContext context,
  required TimeOfDay initialTime,
}) async {
  return await showTimePicker(
    context: context,
    initialTime: initialTime,
  );
}
