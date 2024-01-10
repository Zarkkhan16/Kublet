import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/core/utils/app_colours.dart';
class CustomBackButton extends StatelessWidget {
  CustomBackButton({
    Key? key,
    this.onTap,
    this.addPadding
  }) : super(
          key: key,
        );

  String? imagePath;
  bool? addPadding;


  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if(onTap!=null)
        {
          onTap!.call();
        }
        NavigatorService.goBack();
        },
      icon: Padding(
        padding: EdgeInsets.symmetric(horizontal:addPadding!=false? 8.0:0.0),
        child: Icon(Icons.arrow_back_ios_outlined,color: AppColours.lightGray,size: 20,),
      ),

    );
  }
}
