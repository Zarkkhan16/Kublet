import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/core/constants/apis_constants.dart';
import 'package:kublet/core/utils/styles.dart';
import 'package:kublet/presentation/apps_configuration_page/models/ui_data_model.dart';

class AppsConfigurationListItemWidget extends StatelessWidget {
  UiDataModel? uiDataModel;
  final bool isSelected;
  final Function(bool) onSelectedChanged;

  AppsConfigurationListItemWidget(
  {  this.uiDataModel,
        required this.isSelected,
        required this.onSelectedChanged,
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: isSelected ? 280.adaptSize : 144.adaptSize,
      width: isSelected ? 147.adaptSize : 144.adaptSize,
      margin: EdgeInsets.symmetric(vertical:isSelected ? 4.v:12.v),
      decoration: Styles.imageDecoration,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.h),
        child: CustomImageView(
          fit: BoxFit.fill,
          imagePath: "${ApiConstants.imageBaseUrl}${extractImageName(uiDataModel!.imgUrl!)}",
        ),
      ),
    );
  }
}


String extractImageName(String url) {
  List<String> parts = url.split('/');
  String lastPart = parts.last;
  if (lastPart.endsWith('.png')) {
    return lastPart;
  }
  return '$lastPart.png';
}