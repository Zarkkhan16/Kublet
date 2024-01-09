import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kublet/core/utils/app_colours.dart';

class AppUtils
{

static showToastMessage(String message,{bool? error=false}) {
  Fluttertoast.showToast(

      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor:error==true? Colors.red.withOpacity(0.9):AppColours.lightGray,
      textColor: AppColours.darkGray,
      fontSize: 16.0);
}

}