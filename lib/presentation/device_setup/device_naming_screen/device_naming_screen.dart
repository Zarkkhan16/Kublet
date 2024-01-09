import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/device_setup/device_naming_screen/notifier/device_naming_notifier.dart';
import 'package:kublet/presentation/device_setup/scanning_screen/notifier/scanning_notifier.dart';
import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';
import 'package:kublet/widgets/custom_text_form_field.dart';


class DeviceNamingScreen extends ConsumerStatefulWidget {
  const DeviceNamingScreen({Key? key}) : super(key: key);

  @override
  WifiScreenState createState() => WifiScreenState();
}

class WifiScreenState extends ConsumerState<DeviceNamingScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    ref.read(deviceNamingNotifier).deviceNameController!.text =
        ref.read(scanningNotifier).scanningModel.selectedDevice!;

    super.initState();
  }

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
            SizedBox(height: 26.v),
            Padding(
                padding: EdgeInsets.only(left: 5.h),
                child: Consumer(builder: (context, ref, _) {
                  return CustomTextFormField(
                      controller:
                          ref.watch(deviceNamingNotifier).deviceNameController,
                      hintText: "lbl_wifi_name".tr);
                })),
            Spacer(),
            SizedBox(height: 13.v),
            CustomOutlinedButton(
              onPressed: () => onTapScreenTitle(AppRoutes.wifiScreen),
              text: "lbl_next".tr,
              margin: EdgeInsets.only(left: 6.h),
              buttonStyle: CustomButtonStyles.outlinePrimary,
            )
          ])),

      // bottomNavigationBar: _buildBottomBar(context)
    ));
  }

  void onTapScreenTitle(String routeName) =>
      NavigatorService.pushNamed(routeName);

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 40.h, top: 23.v, bottom: 20.v),
            onTap: () {}),
        centerTitle: true,
        title: AppbarTitle(
          text: "lbl_name".tr,
        ));
  }
}
