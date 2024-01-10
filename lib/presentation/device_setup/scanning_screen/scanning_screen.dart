import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/core/utils/app_colours.dart';
import 'package:kublet/presentation/device_setup/scanning_screen/notifier/scanning_notifier.dart';
import 'package:kublet/presentation/device_setup/scanning_screen/widgets/found_device_widget.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/custom_loader.dart';

class ScanningScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Stack(
              children: [
                Container(
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
                          Text("lbl_devices".tr,
                              style: theme.textTheme.titleMedium),
                          SizedBox(height: 10.v),
                          FoundDeviceWidget(),
                        ])),
                Consumer(
                  builder: (context, ref, _) =>ref.watch(scanningNotifier).scanningModel.connecting==true?CustomLoader():SizedBox()
                ),
              ],
            )));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        centerTitle: true,
        title: AppbarTitle(text: "lbl_device".tr));
  }
}
