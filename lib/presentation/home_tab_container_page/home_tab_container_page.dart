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
   TabController? tabviewController;

  @override
  void initState() {
    super.initState();
    ///getting tags
    getTags();
    tabviewController = TabController(length: 5, vsync: this);
  }

  getTags() async {
    await ref.read(homeTabContainerNotifier.notifier).setTags();
    tabviewController = TabController(
        length: ref
            .watch(homeTabContainerNotifier)
            .tagsResponse!
            .dataResponse!
            .length,
        vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var model = ref.watch(homeTabContainerNotifier);
    var controller = ref.watch(homeTabContainerNotifier.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Consumer(
          builder: (context, ref, _) => model.tagsResponse!.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 14.v),
                TabBar(
                  controller: tabviewController??TabController(length: 0, vsync: this),
                  labelPadding: EdgeInsets.zero,
                  isScrollable: true,
                  onTap: controller.updateSelectedIndex,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  tabs: List.generate(
                    model.tagsResponse!.dataResponse!.length,
                    (i) => CustomTab(
                      label: "${model.tagsResponse!.dataResponse![i]}".tr,
                      isSelected: model.selectedIndex == i,
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabviewController??TabController(length: 0, vsync: this),
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      ref
                          .watch(homeTabContainerNotifier)
                          .tagsResponse!
                          .dataResponse!
                          .length,
                      (index) => HomePage(),
                    ),
                  ),
                ),
              ],
            ),
            empty: () => const Center(child: Text('No Data Found')),
            error: (message) => Center(
                child: Text(
              message,
              style: TextStyle(color: Colors.white),
            )),
          ),
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
