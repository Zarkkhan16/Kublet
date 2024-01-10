import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/home_page/notifier/home_notifier.dart';
import 'package:kublet/widgets/buttons/custom_back_button.dart';
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
                bottomNavigationBar:  CustomOutlinedButton(
                  text: "lbl_configure".tr,
                  margin:EdgeInsets.symmetric(horizontal: 27.h, vertical: 26.v),
                  buttonStyle: CustomButtonStyles.outlinePrimary,
                  onPressed: ()=>_onTapScreenTitle(AppRoutes.appsConfigurationScreen),

                ),
                body: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                    child: Scrollbar(
                      thickness:1,
                      child: ListView(
                              padding:EdgeInsets.zero,
                          children: [
                            if(model.selectedApp!=null)
                            Padding(
                              padding:  EdgeInsets.all(8.h),
                              child: Text(model.selectedApp!.info,
                                  style: theme.textTheme.bodyLarge
                              ),
                            ),

                          ]),
                    )),
            )
        );
      }
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        centerTitle: true,
        leading:CustomBackButton(),
        title: AppbarTitle(text:ref.watch(homeNotifier).selectedApp!.name)
    );
  }

  void _onTapScreenTitle(String routeName) =>NavigatorService.pushNamed(routeName);




}
