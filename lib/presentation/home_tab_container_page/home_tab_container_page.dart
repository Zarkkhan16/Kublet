import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/home_page/home_page.dart';
import 'package:kublet/presentation/home_tab_container_page/notifier/home_tab_container_notifier.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/tabs/custom_tab.dart';

class HomeTabContainerPage extends ConsumerStatefulWidget {
  const HomeTabContainerPage({Key? key})
      : super(
    key: key,
  );

  @override
  HomeTabContainerPageState createState() => HomeTabContainerPageState();
}

class HomeTabContainerPageState extends ConsumerState<HomeTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length:4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var model = ref.watch(homeTabContainerNotifier);
    var controller = ref.watch(homeTabContainerNotifier.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14.v),
            TabBar(
              controller: tabviewController,
              labelPadding: EdgeInsets.zero,
              isScrollable: true,
              onTap:controller.updateSelectedIndex,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabs: List.generate(
                model.tabLabels!.length,
                    (i) => CustomTab(
               label: "${model.tabLabels![i]}".tr,
                 isSelected:model.selectedIndex == i,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabviewController,
                children: List.generate(
                  model.tabLabels!.length,
                      (index) => HomePage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(

      title: Container(
        margin: EdgeInsets.only(left: 32.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AppbarTitle(
              text: "${"lbl_browse_apps".tr}",
            ),
            AppbarTitle(
              text: "lbl_browse_apps".tr,
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 32.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgSearchOnprimary,
            height: 25.adaptSize,
            width: 25.adaptSize,
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }

}
