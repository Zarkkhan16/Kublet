import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/core/constants/apis_constants.dart';
import 'package:kublet/core/utils/app_colours.dart';
import 'package:kublet/core/utils/styles.dart';
import 'package:kublet/data/models/apps/app_model.dart';

class AppsListItemWidget extends StatelessWidget {
  AppsListItemWidget(
    this.appModel, {
      this.onTap,
    Key? key,
  }) : super(
          key: key,
        );
  AppModel appModel;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 110.adaptSize,
            width: 110.adaptSize,
            decoration: Styles.imageDecoration,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.h),
              child: CustomImageView(
                imagePath: "${ApiConstants.imageBaseUrl}${extractImageName(appModel.imgUrl)}",
              ),
            ),
          ),




          Padding(
            padding: EdgeInsets.only(
              left: 24.h,
              top: 3.v,
              bottom: 35.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 4.v,
                ),
                Text(
                  appModel.name,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10.v,
                ),
                SizedBox(
                  height: 41.v,
                  width: 137.h,
                  child: Text(
                    appModel.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall!.copyWith(
                      height: 1.20,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }


  String extractImageName(String url) {
    List<String> parts = url.split('/');
    String lastPart = parts.last;
    if (lastPart.endsWith('.png')) {
      return lastPart;
    }
    return '$lastPart.png';
  }

}
