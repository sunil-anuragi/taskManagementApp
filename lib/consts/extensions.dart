import 'package:flutter/material.dart';

extension Extnum on num {
  Widget get vs => SizedBox(height: toDouble());
  Widget get hs => SizedBox(width: toDouble());
}

extension GestureDetectorExtension on Widget {
  GestureDetector onTap(VoidCallback onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: this,
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  String to1stLower() => length > 0 ? '${this[0].toLowerCase()}$this' : '';
}

enum Gender { male, female, others }

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.others:
        return 'Others';
    }
  }
}
