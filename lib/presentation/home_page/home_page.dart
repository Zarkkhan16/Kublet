import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/home_page/widgets/apps_list_widget.dart';

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
              data: (data) => AppListWidget(data.apps),
              empty: () => const Center(child: Text('No Data Found')),
              error: (message) => Center(child: Text(message)),
            ),
      ),
    );
  }
}
