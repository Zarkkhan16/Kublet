import 'package:flutter/painting.dart';
import 'package:kublet/core/utils/app_colours.dart';
import 'package:kublet/core/utils/size_utils.dart';
import 'package:kublet/theme/theme_helper.dart';

class Styles {
  static Decoration imageDecoration = BoxDecoration(
    color: appTheme.blueGray,
    borderRadius: BorderRadius.circular(10.h),
    border: Border.all(
      color: AppColours.gray,
      width: 0.5,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColours.gray.withOpacity(0.22),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
  );
}
