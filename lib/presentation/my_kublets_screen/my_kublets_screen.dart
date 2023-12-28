import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';

class MyKubletsScreen extends ConsumerStatefulWidget {
  const MyKubletsScreen({Key? key}) : super(key: key);

  @override
  SelectedAppOneScreenState createState() => SelectedAppOneScreenState();
}

class SelectedAppOneScreenState extends ConsumerState<MyKubletsScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 26.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 13.h),
                          child: Text("msg_us_stock_data_powered".tr,
                              style: theme.textTheme.bodyLarge)),
                      Spacer(),
                      CustomOutlinedButton(
                          text: "lbl_configure".tr,
                          margin: EdgeInsets.only(right: 6.h),
                             buttonStyle: CustomButtonStyles.outlinePrimary,
                            onPressed: ()=>_onTapScreenTitle(AppRoutes.stocksScreen),

                      )
                    ])),
        )
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        centerTitle: true,
        title: AppbarTitle(text: "lbl_stocks".tr));
  }

  void _onTapScreenTitle(String routeName) =>NavigatorService.pushNamed(routeName);




}
