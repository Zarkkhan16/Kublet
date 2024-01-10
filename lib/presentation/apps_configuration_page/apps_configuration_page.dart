import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/data/models/apps/app_data_model.dart';
import 'package:kublet/data/models/device/device_model.dart';
import 'package:kublet/presentation/apps_configuration_page/models/drop_down_data_model.dart';
import 'package:kublet/presentation/apps_configuration_page/models/ui_data_model.dart';
import 'package:kublet/presentation/apps_configuration_page/notifier/apps_configuration_notifier.dart';
import 'package:kublet/presentation/apps_configuration_page/widgets/apps_configuration_item_widget.dart';
import 'package:kublet/presentation/home_page/notifier/home_notifier.dart';
import 'package:kublet/widgets/buttons/custom_back_button.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';
import 'package:kublet/widgets/custom_text_form_field.dart';
import 'package:kublet/widgets/drop_downs/custom_drop_down_search.dart';

class AppsConfigurationScreen extends ConsumerStatefulWidget {
  const AppsConfigurationScreen({Key? key}) : super(key: key);

  @override
  SelectedAppPageState createState() => SelectedAppPageState();
}

class SelectedAppPageState extends ConsumerState<AppsConfigurationScreen> {
  final PageController pageController = PageController(
    viewportFraction: 0.45,
  );
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    if(ref.read(homeNotifier).selectedApp!=null)
    ref
        .read(appsConfigurationAppNotifier.notifier)
        .getSelectedAppConfiguration(ref.read(homeNotifier).selectedApp!.id);

    pageController.addListener(() {
      int pos = pageController.page!.round();
      if (currentPage != pos) {
        {
          setState(() {
            currentPage = pos;
          });
        }
      }
    });
  }

  DropdownDataModel? selectedDropDownValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body:

      ref.watch(appsConfigurationAppNotifier).loading == true
          ? Center(child: CircularProgressIndicator())
          : Consumer(
              builder: (context, ref, _) => ref
                  .watch(appsConfigurationAppNotifier)
                  .appsConfigurationListResponse!
                  .when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    data: (data) => _buildPage(),
                    empty: () => const Center(child: Text('No Data Found')),
                    error: (message) => Center(child: Text(message)),
                  ),
            ),
    ));
  }

  _buildPage() {
    return Consumer(builder: (context, ref, _) {
      return Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 24.v),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDropDown(context),
                SizedBox(height: 52.v),

                _buildAppUIDataList(),
                SizedBox(height: 30.v),
                _buildStaticIp(context),
                Spacer(),
                CustomOutlinedButton(
                    onPressed: () {
                      ref
                          .read(appsConfigurationAppNotifier.notifier)
                          .saveAppInfo(AppDataModel(
                            appId: ref.watch(homeNotifier).selectedApp!.id,
                            tickerId: selectedDropDownValue!.id,
                            tickerName: selectedDropDownValue!.name,
                            tickerSymbol: selectedDropDownValue!.symbol,
                            uiImageUrl: ref
                                .watch(appsConfigurationAppNotifier)
                                .appsConfigurationListResponse!
                                .dataResponse![1]
                                .uiDataList![currentPage]
                                .imgUrl,
                            firmwareUrl: ref
                                .watch(appsConfigurationAppNotifier)
                                .appsConfigurationListResponse!
                                .dataResponse![1]
                                .uiDataList![currentPage]
                                .firmwareUrl,
                          ));
                    },
                    text: "lbl_configure".tr,
                    margin: EdgeInsets.only(left: 27.h, right: 33.h),
                    buttonStyle: CustomButtonStyles.outlinePrimary,
                    alignment: Alignment.center)
              ]));
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        leading: CustomBackButton(),
        centerTitle: true,
        title: AppbarTitle(
          // text: "lbl_AppsConfiguration".tr
          text: ref.watch(homeNotifier).selectedApp!.name,
        ));
  }

  Widget _buildDropDown(BuildContext context) {
    var model = ref
        .watch(appsConfigurationAppNotifier)
        .appsConfigurationListResponse!
        .dataResponse!
        .first;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 28.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Consumer(builder: (context, ref, _) {
            return CustomDropDownSearch(
                // title: "lbl_ticker".tr,
                title: model.id,
                // hintText: "lbl_aapl".tr,
                hintText: "Select",
                value: selectedDropDownValue ?? DropdownDataModel(),
                alignment: Alignment.centerRight,
                items: model.dropdownData!,
                onChanged: (value) {
                  selectedDropDownValue = value;
                  setState(() {});
                });
          })
        ]));
  }

  Widget _buildAppUIDataList() {
    var model = ref
        .watch(appsConfigurationAppNotifier)
        .appsConfigurationListResponse!
        .dataResponse![1];
    return model.uiDataList==null?SizedBox():Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 40.h),
              child:
              Text("lbl_ui".tr, style: theme.textTheme.titleMedium)),
          SizedBox(height: 10.v),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: model.uiDataList!.length ?? 0,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    bool active = index == currentPage;
      
                    late UiDataModel uiDataModel = model.uiDataList![index];
      
                    return Center(
                      child: AppsConfigurationListItemWidget(
                        uiDataModel: uiDataModel,
                        isSelected: active,
                        onSelectedChanged: (_) {},
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaticIp(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
              title: "lbl_static_ip".tr,
              controller:
                  ref.watch(appsConfigurationAppNotifier).editTextController,
              textInputAction: TextInputAction.done,
              alignment: Alignment.centerRight);
        }));
  }
}
