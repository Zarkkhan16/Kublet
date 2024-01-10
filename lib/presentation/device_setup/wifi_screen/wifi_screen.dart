import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/data/models/device/device_info.dart';
import 'package:kublet/data/models/device/device_model.dart';
import 'package:kublet/presentation/device_setup/device_naming_screen/notifier/device_naming_notifier.dart';
import 'package:kublet/presentation/device_setup/scanning_screen/notifier/scanning_notifier.dart';
import 'package:kublet/presentation/device_setup/wifi_screen/notifier/wifi_notifier.dart';
import 'package:kublet/widgets/buttons/custom_back_button.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';
import 'package:kublet/widgets/custom_text_form_field.dart';

class WifiScreen extends ConsumerStatefulWidget {
  const WifiScreen({Key? key}) : super(key: key);

  @override
  WifiScreenState createState() => WifiScreenState();
}

class WifiScreenState extends ConsumerState<WifiScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(context),
      resizeToAvoidBottomInset: false,
      body: ref.watch(wifiNotifier).loading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 22.v),
              child: Column(children: [
                SizedBox(height: 26.v),
                _buildWifiSettings(context),
                SizedBox(height: 14.v),
                _buildPasswordSettings(context),
                Spacer(),
                SizedBox(height: 13.v),
                //saving data first  time here
                CustomOutlinedButton(
                  onPressed: () {
                    {
                      ref.read(wifiNotifier.notifier).saveDeviceInfo(
                          DeviceInfo(
                              deviceName: ref
                                  .read(scanningNotifier)
                                  .scanningModel
                                  .selectedDevice,
                              deviceUpdatedName: ref
                                  .read(deviceNamingNotifier)
                                  .deviceNameController!
                                  .text,));
                    }
                  },
                  text: "lbl_next".tr,
                  margin: EdgeInsets.only(left: 6.h),
                  buttonStyle: CustomButtonStyles.outlinePrimary,
                )
              ])),

      // bottomNavigationBar: _buildBottomBar(context)
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
                controller: ref.watch(wifiNotifier).ssidController);
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
                controller: ref.watch(wifiNotifier).passwordController,
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
