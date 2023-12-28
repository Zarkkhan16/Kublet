import 'package:flutter/material.dart';
import 'package:kublet/core/utils/image_constant.dart';
import 'package:kublet/core/utils/size_utils.dart';
import 'package:kublet/theme/app_decoration.dart';
import 'package:kublet/theme/theme_helper.dart';
import 'package:kublet/widgets/custom_image_view.dart';

class RightIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String? icon;
  final Decoration? decoration;

  RightIconButton({required this.onTap, required this.title, this.icon,this.decoration});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 12.v),
        decoration:decoration?? AppDecoration.fillOnPrimaryContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                title,
                style: theme.textTheme.titleMedium,
              ),
            ),
              CustomImageView(
                imagePath: icon??ImageConstant.imgArrowLeft,
                height: 12.v,
                width: 6.h,
                margin: EdgeInsets.only(top: 5.v, bottom: 6.v),
              ),
          ],
        ),
      ),
    );
  }
}
