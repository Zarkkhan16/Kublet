import 'notifier/scanning_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';



class ScanningScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final controller=ref.read(scanningNotifier.notifier);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 25.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 254.h,
                          margin: EdgeInsets.only(right: 56.h),
                          child: Text("msg_power_your_kublet".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(height: 1.50))),
                      SizedBox(height: 38.v),
                      TextButton(
                        onPressed:()=>controller.onTapScreenTitle(AppRoutes.foundDeviceScreen),
                        child: Text("lbl_devices".tr,
                            style: theme.textTheme.titleMedium),
                      ),
                      SizedBox(height: 5.v)
                    ]))));
  }



  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 40.h, top: 23.v, bottom: 20.v),
            onTap: () {}),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_device".tr));
  }


}
