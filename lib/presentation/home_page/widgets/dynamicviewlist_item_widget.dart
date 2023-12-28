import '../models/dynamicviewlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';

class DynamicViewlistItemWidget extends StatelessWidget {
  DynamicViewlistItemWidget(
    this.dynamicviewlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  DynamicviewlistItemModel dynamicviewlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 110.adaptSize,
          width: 110.adaptSize,
          decoration: BoxDecoration(
            color: appTheme.blueGray,
            borderRadius: BorderRadius.circular(
              10.h,
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
                height: 24.v,
                width: 77.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        dynamicviewlistItemModelObj.openApiText!,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        dynamicviewlistItemModelObj.openApiText1!,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.v),
              SizedBox(
                height: 41.v,
                width: 137.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 137.h,
                        child: Text(
                          dynamicviewlistItemModelObj.sendDataText!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall!.copyWith(
                            height: 1.20,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 137.h,
                        child: Text(
                          dynamicviewlistItemModelObj.sendDataText1!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall!.copyWith(
                            height: 1.20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
