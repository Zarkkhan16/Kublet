import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomTextStyles {
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black,
      );
  static get titleMediumBluegray100 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
}


