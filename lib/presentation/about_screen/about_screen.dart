import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';

class AboutScreen extends ConsumerStatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  AboutScreenState createState() => AboutScreenState();
}

class AboutScreenState extends ConsumerState<AboutScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 16.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTen(context),
                      SizedBox(height: 35.v),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Text("msg_app_version_1_2_1".tr,
                              style: CustomTextStyles.titleMediumSemiBold)),
                      SizedBox(height: 5.v)
                    ])),
        ));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 43.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 37.h, top: 23.v, bottom: 20.v),),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_about2".tr));
  }

  Widget _buildTen(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 13.v),
        decoration: AppDecoration.fillOnPrimaryContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 17.h, right: 11.h),
                  child:
                      _buildTermsOfUse(context, text: "lbl_privacy_policy".tr)),
              SizedBox(height: 10.v),
              Divider(color: appTheme.black),
              SizedBox(height: 11.v),
              Padding(
                  padding: EdgeInsets.only(left: 17.h, right: 11.h),
                  child: _buildTermsOfUse(context, text: "lbl_terms_of_use".tr))
            ]));
  }


  Widget _buildTermsOfUse(
    BuildContext context, {
    required String text,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,
              style: theme.textTheme.titleMedium!
                  .copyWith(color: theme.colorScheme.onPrimary)),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 12.v,
              width: 6.h,
              margin: EdgeInsets.only(top: 5.v, bottom: 6.v))
        ]);
  }


}
