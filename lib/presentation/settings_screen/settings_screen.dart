import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/right_icon_button.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends ConsumerState<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.v),
                child: Column(children: [
                  _buildConnectivity(context),
                  SizedBox(height: 46.v),
                  _buildInfoAndSupport(context),
                  SizedBox(height: 5.v)
                ])),
        )

    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 36.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 30.h, top: 19.v, bottom: 24.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_settings".tr));
  }

  Widget _buildConnectivity(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: Text("lbl_connectivity".tr,
                  style: CustomTextStyles.titleMediumBluegray100)),
          SizedBox(height: 6.v),

          RightIconButton(
            onTap: () =>_onTapScreenTitle(AppRoutes.wifiScreen),
            title: "lbl_wi_fi".tr,
            icon: ImageConstant.imgArrowRight,
          ),
        ]));
  }

  Widget _buildInfoAndSupport(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_info_and_support".tr,
              style: CustomTextStyles.titleMediumBluegray100),
          SizedBox(height: 8.v),

          RightIconButton(
            onTap: () {},
            title: "lbl_help".tr,
            icon: ImageConstant.imgArrowRight,
            decoration: AppDecoration.fillOnPrimaryContainer
                .copyWith(borderRadius:BorderRadius.only(
              topLeft:Radius.circular(8.h),
              topRight:Radius.circular(8.h)
            )),
          ),
         Divider(color: appTheme.black),

        RightIconButton(
          onTap: () =>_onTapScreenTitle(AppRoutes.aboutScreen),
          title: "lbl_about".tr,
          icon: ImageConstant.imgArrowRight,
          decoration: AppDecoration.fillOnPrimaryContainer
              .copyWith(borderRadius:BorderRadius.only(
              bottomRight:Radius.circular(8.h),
              bottomLeft:Radius.circular(8.h)
          )),
        ),
        ]));
  }

  void _onTapScreenTitle(String routeName) =>NavigatorService.pushNamed(routeName);



}
