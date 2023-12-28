import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'notifier/wifi_naming_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';
import 'package:kublet/widgets/custom_text_form_field.dart';

class WifiNamingScreen extends ConsumerStatefulWidget {
  const WifiNamingScreen({Key? key}) : super(key: key);

  @override
  WifiScreenState createState() => WifiScreenState();
}
class WifiScreenState extends ConsumerState<WifiNamingScreen> {
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
                                child: Text("lbl_name".tr,
                                    style: theme.textTheme.headlineLarge))
                          ]))),
                  SizedBox(height: 26.v),
                  Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Consumer(builder: (context, ref, _) {
                        return CustomTextFormField(
                            controller: ref
                                .watch(wifiNamingNotifier)
                                .wifiNameController,
                            hintText: "lbl_wifi_name".tr);
                      })),
                  Spacer(),
                  SizedBox(height: 13.v),
                  CustomOutlinedButton(
                    onPressed: ()=>onTapScreenTitle(AppRoutes.wifiPasswordScreen),
                      text: "lbl_next".tr, margin: EdgeInsets.only(left: 6.h),
                    buttonStyle:  CustomButtonStyles.outlinePrimary,
                      
                  )
                ])),
            
            // bottomNavigationBar: _buildBottomBar(context)
    )
    );
  }

  void onTapScreenTitle(String routeName) => NavigatorService.pushNamed(routeName);



}
