import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
class AppbarLeadingImage extends StatelessWidget {
  AppbarLeadingImage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(onTap!=null)
        {
          onTap!.call();
        }
        NavigatorService.goBack();
        },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 12.v,
          width: 6.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
