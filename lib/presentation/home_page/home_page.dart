import '../home_page/widgets/dynamicviewlist_item_widget.dart';
import 'models/dynamicviewlist_item_model.dart';
import 'notifier/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';

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
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillBlack,
          child: Column(
            children: [
              SizedBox(height: 31.v),
              _buildDynamicViewList(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDynamicViewList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 40.h,
        right: 44.h,
      ),
      child: Consumer(
        builder: (context, ref, _) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 26.v,
              );
            },
            itemCount: ref
                    .watch(homeNotifier)
                    .homeModelObj
                    ?.dynamicviewlistItemList
                    .length ??
                0,
            itemBuilder: (context, index) {
              DynamicviewlistItemModel model = ref
                      .watch(homeNotifier)
                      .homeModelObj
                      ?.dynamicviewlistItemList[index] ??
                  DynamicviewlistItemModel();
              return DynamicViewlistItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
