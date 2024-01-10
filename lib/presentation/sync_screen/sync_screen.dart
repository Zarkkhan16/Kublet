import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/widgets/buttons/custom_back_button.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';

class SyncScreen extends ConsumerStatefulWidget {
  const SyncScreen({Key? key}) : super(key: key);

  @override
  SyncScreenState createState() => SyncScreenState();
}

class SyncScreenState extends ConsumerState<SyncScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 39.h, vertical: 25.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 274.h,
                          margin: EdgeInsets.only(left: 1.h, right: 37.h),
                          child: Text("msg_press_the_back_button".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(height: 1.50))),
                      SizedBox(height: 56.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text("lbl_devices".tr,
                              style: theme.textTheme.titleMedium)),
                      SizedBox(height: 28.v),
                      CustomOutlinedButton(
                          text: "lbl_kublet".tr,
                          margin: EdgeInsets.only(left: 1.h),
                          buttonStyle: CustomButtonStyles.outlineOnPrimary,
                          buttonTextStyle:
                              CustomTextStyles.titleMediumBlack900),
                      Spacer(),
                      CustomOutlinedButton(
                          text: "lbl_connect".tr,
                          margin: EdgeInsets.only(left: 1.h))
                    ])),
            // bottomNavigationBar: _buildBottomBar(context)
        ));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        leading: CustomBackButton(),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_device".tr));
  }


}
