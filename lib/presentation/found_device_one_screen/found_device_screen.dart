import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/found_device_one_screen/models/found_device_model.dart';
import 'package:kublet/presentation/found_device_one_screen/notifier/found_device_notifier.dart';
import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';

class FoundDeviceScreen extends ConsumerStatefulWidget {
  const FoundDeviceScreen({Key? key}) : super(key: key);

  @override
  FoundDeviceOneScreenState createState() => FoundDeviceOneScreenState();
}

class FoundDeviceOneScreenState extends ConsumerState<FoundDeviceScreen> {
  @override
  Widget build(BuildContext context) {

    final controller=ref.read(foundDeviceNotifier.notifier);
    final model=ref.watch(foundDeviceNotifier).foundDeviceModelObj;

    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 25.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 254.h,
                          margin: EdgeInsets.only(left: 10.h, right: 66.h),
                          child: Text("msg_power_your_kublet".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(height: 1.50))),
                      SizedBox(height: 38.v),
                      Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text("lbl_devices".tr,
                              style: theme.textTheme.titleMedium)),
                      SizedBox(height: 28.v),
                      CustomOutlinedButton(
                          text: "lbl_kublet".tr,
                          buttonStyle: CustomButtonStyles.outlineOnPrimary,
                          buttonTextStyle:
                              CustomTextStyles.titleMediumBlack900),
                      SizedBox(height: 5.v)
                    ])),

            bottomNavigationBar: _buildConnect(context,model!,controller)));

  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 38.h, top: 23.v, bottom: 20.v),
            onTap: () {}),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_device".tr));
  }

  Widget _buildConnect(BuildContext context,FoundDeviceModel model,FoundDeviceNotifier controller) {
    return CustomOutlinedButton(
      text: model.connecting==true ? "lbl_connecting".tr : "Connect".tr,
      onPressed: () =>controller.connectAndMoveToNextScreen(context),
      margin: EdgeInsets.only(left: 28.h, right: 32.h, bottom: 44.v),
      buttonStyle: model.connecting==true ? CustomButtonStyles.outlineGray : CustomButtonStyles.outlinePrimary,
    );

  }


}
