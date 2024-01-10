import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/custom_back_button.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';
import 'package:kublet/widgets/custom_text_form_field.dart';

import 'notifier/wifi_notifier.dart';

class EditWifiScreen extends ConsumerStatefulWidget {
  const EditWifiScreen({Key? key}) : super(key: key);

  @override
  WifiScreenState createState() => WifiScreenState();
}

class WifiScreenState extends ConsumerState<EditWifiScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(context),
      resizeToAvoidBottomInset: false,
      body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 22.v),
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(left: 5.h),
                child: Consumer(builder: (context, ref, _) {
                  return CustomTextFormField(
                      controller:
                          ref.watch(editWifiNotifier).wifiNameController,
                      hintText: "lbl_wifi_name".tr);
                })),
            SizedBox(height: 43.v),
            _buildWifiSettings(context),
            SizedBox(height: 14.v),
            _buildPasswordSettings(context),
            Spacer(),
            CustomOutlinedButton(
              onPressed: () {},
              text: "lbl_update".tr,
              margin: EdgeInsets.only(left: 6.h),
              buttonStyle: CustomButtonStyles.outlinePrimary,
            )
          ])),
    ));
  }

  Widget _buildWifiSettings(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Text("lbl_new_ssid".tr,
                  style: CustomTextStyles.titleMediumBluegray100)),
          SizedBox(height: 9.v),
          Consumer(builder: (context, ref, _) {
            return CustomTextFormField(
                controller: ref.watch(editWifiNotifier).ssidController);
          })
        ]));
  }

  Widget _buildPasswordSettings(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 5.h),
              child: Text("lbl_new_password".tr,
                  style: CustomTextStyles.titleMediumBluegray100)),
          SizedBox(height: 9.v),
          Consumer(builder: (context, ref, _) {
            return CustomTextFormField(
                controller: ref.watch(editWifiNotifier).passwordController,
                textInputAction: TextInputAction.done,
                obscureText: true);
          })
        ]));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        leading: CustomBackButton(),
        centerTitle: true,
        title: AppbarTitle(
          text: "lbl_wi_fi".tr,
        ));
  }
}
