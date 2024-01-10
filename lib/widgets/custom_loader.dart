import 'package:flutter/material.dart';
import 'package:kublet/core/utils/app_colours.dart';

class CustomLoader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: double.infinity,
        width:double.infinity,
        color: AppColours.black.withOpacity(0.6),
        child: Center(child: CircularProgressIndicator()));
  }
}
