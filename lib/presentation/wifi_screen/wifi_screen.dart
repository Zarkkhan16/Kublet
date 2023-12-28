import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'notifier/wifi_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';
import 'package:kublet/widgets/custom_text_form_field.dart';

class WifiScreen extends ConsumerStatefulWidget {
  const WifiScreen({Key? key}) : super(key: key);

  @override
  WifiScreenState createState() => WifiScreenState();
}
class WifiScreenState extends ConsumerState<WifiScreen> {

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
                            AppbarLeadingImage(imagePath: ImageConstant.imgArrowLeft,),                            Padding(
                                padding: EdgeInsets.only(left: 123.h),
                                child: Text("lbl_wi_fi".tr,
                                    style: theme.textTheme.headlineLarge))
                          ]))),
                  SizedBox(height: 26.v),
                  Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Consumer(builder: (context, ref, _) {
                        return CustomTextFormField(
                            controller: ref
                                .watch(wifiNotifier)
                                .wifiNameController,
                            hintText: "lbl_wifi_name".tr);
                      })),
                  SizedBox(height: 43.v),
                  _buildWifiSettings(context),
                  SizedBox(height: 14.v),
                  _buildPasswordSettings(context),
                  Spacer(),
                  CustomOutlinedButton(
                    onPressed: (){

                    },
                      text: "lbl_update".tr, margin: EdgeInsets.only(left: 6.h),
                    buttonStyle:  CustomButtonStyles.outlinePrimary,
                      
                  )
                ])),
            
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


}
