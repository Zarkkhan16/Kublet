import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/home_page/notifier/home_notifier.dart';
import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';

class SelectedAppsDetailScreen extends ConsumerStatefulWidget {
  const SelectedAppsDetailScreen({Key? key}) : super(key: key);

  @override
  SelectedAppOneScreenState createState() => SelectedAppOneScreenState();
}

class SelectedAppOneScreenState extends ConsumerState<SelectedAppsDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,_) {
        var model=ref.watch(homeNotifier);
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
                              child: Text(model.selectedApp!.info,
                                  style: theme.textTheme.bodyLarge)),
                          Spacer(),
                          CustomOutlinedButton(
                              text: "lbl_configure".tr,
                              margin: EdgeInsets.only(right: 6.h),
                                 buttonStyle: CustomButtonStyles.outlinePrimary,
                                onPressed: ()=>_onTapScreenTitle(AppRoutes.appsConfigurationScreen),

                          )
                        ])),
            )
        );
      }
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        centerTitle: true,
        leading:AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 30.h, top: 19.v, bottom: 24.v)),
        title: AppbarTitle(text:ref.watch(homeNotifier).selectedApp!.name)
    );
  }

  void _onTapScreenTitle(String routeName) =>NavigatorService.pushNamed(routeName);




}
