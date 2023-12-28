import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
}

class BorderRadiusStyle {
  static BorderRadius get roundedBorder8 => BorderRadius.circular(8.h);
}
