import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/data/models/apps/app_model.dart';
import 'package:kublet/presentation/home_page/notifier/home_notifier.dart';
import 'package:kublet/presentation/home_page/widgets/apps_list_item_widget.dart';
import 'package:kublet/presentation/home_tab_container_page/notifier/home_tab_container_notifier.dart';

class AppListWidget extends ConsumerWidget {
  final List<AppModel> list;
  List<AppModel>? filteredList;

  AppListWidget(this.list);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeTabContainer = ref.watch(homeTabContainerNotifier.notifier).state;
    var selectedTag = homeTabContainer.tagsResponse!.dataResponse![homeTabContainer.selectedIndex ?? 0];
    filteredList=[];
    var shouldShowCompleteList = homeTabContainer.selectedIndex == 0 ||
        selectedTag.toLowerCase() == "all";



    filteredList= shouldShowCompleteList
        ? list
        : list
        .where((appModel) =>
        appModel.tags.contains(selectedTag.toLowerCase()))
        .toList();

    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1), () => filteredList),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }  else {
          List<AppModel> delayedList = snapshot.data as List<AppModel>;
          return Padding(
            padding: EdgeInsets.only(left: 40.h, right: 44.h, top: 25.h, bottom: 5.h),
            child:delayedList.length==0?
            Center(child: Text("No record found", style: theme.textTheme.titleMedium,)):
            ListView.separated(
              separatorBuilder: (
                  context,
                  index,
                  ) {
                return SizedBox(
                  height: 26.v,
                );
              },
              itemCount: delayedList.length,
              itemBuilder: (context, index) {
                AppModel appModel = delayedList[index];

                return AppsListItemWidget(
                  appModel,
                  onTap: () {
                    ref.watch(homeNotifier.notifier).setSelectedApp(appModel);
                    ref
                        .watch(homeNotifier.notifier)
                        .onTapTitle(AppRoutes.AppsDetail);
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
