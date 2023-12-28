import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'notifier/wifi_password_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';
import 'package:kublet/widgets/custom_text_form_field.dart';

class WifiPasswordScreen extends ConsumerStatefulWidget {
  const WifiPasswordScreen({Key? key}) : super(key: key);

  @override
  WifiScreenState createState() => WifiScreenState();
}
class WifiScreenState extends ConsumerState<WifiPasswordScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 22.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: Row(children: [
                            AppbarLeadingImage(),
                            Padding(
                                padding: EdgeInsets.only(left: 123.h),
                                child: Text("lbl_wi_fi".tr,
                                    style: theme.textTheme.headlineLarge))
                          ]))),
                  SizedBox(height: 26.v),
                  _buildWifiSettings(context),
                  SizedBox(height: 14.v),
                  _buildPasswordSettings(context),
                  Spacer(),
                  SizedBox(height: 13.v),
                  CustomOutlinedButton(
                    onPressed: ()=>onTapScreenTitle(AppRoutes.homeContainerScreen),
                      text: "lbl_next".tr, margin: EdgeInsets.only(left: 6.h),
                    buttonStyle:  CustomButtonStyles.outlinePrimary,
                      
                  )
                ])),
            
            // bottomNavigationBar: _buildBottomBar(context)
    )
    );
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
                controller: ref.watch(wifiPasswordNotifier).ssidController);
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
                controller: ref.watch(wifiPasswordNotifier).passwordController,
                textInputAction: TextInputAction.done,
                obscureText: true);
          })
        ]));
  }

  void onTapScreenTitle(String routeName) => NavigatorService.pushNamed(routeName);




}
