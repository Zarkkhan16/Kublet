import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/data/models/apps/app_model.dart';
import 'package:kublet/presentation/home_page/widgets/apps_list_item_widget.dart';
import 'notifier/home_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  void initState() {
    get();
    super.initState();
  }

  get() async {
    await ref.read(homeNotifier.notifier).setApps();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, ref, _) => ref
            .watch(homeNotifier)
            .appsResponse!
            .when(
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (data) => _buildAppsViewList(context, data.apps),
              empty: () => const Center(child: Text('No Data Found')),
              error: (message) => Center(child: Text(message)),
            ),
      ),
    );
  }

  Widget _buildAppsViewList(BuildContext context, List<AppModel> list) {
    return Padding(
      padding: EdgeInsets.only(left: 40.h, right: 44.h, top: 25.h, bottom: 5.h),
      child: Consumer(
        builder: (context, ref, _) {
          return ListView.separated(
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 26.v,
              );
            },
            itemCount: list.length,
            itemBuilder: (context, index) {
              AppModel appModel = list[index];

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
          );
        },
      ),
    );
  }
}
