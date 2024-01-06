import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/apps_configuration_page/models/drop_down_data_model.dart';
import 'package:kublet/presentation/apps_configuration_page/models/ui_data_model.dart';
import 'package:kublet/presentation/apps_configuration_page/notifier/apps_configuration_notifier.dart';
import 'package:kublet/presentation/apps_configuration_page/widgets/apps_configuration_item_widget.dart';
import 'package:kublet/presentation/home_page/notifier/home_notifier.dart';
import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';
import 'package:kublet/widgets/custom_text_form_field.dart';
import 'package:kublet/widgets/drop_downs/custom_drop_down.dart';
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

  // late SelectionPopupModel selectedDropDownValue;
  late DropdownDataModel selectedDropDownValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body:Consumer(
              builder: (context, ref, _) => ref
                  .watch(appsConfigurationAppNotifier)
                  .appsConfigurationListResponse!
                  .when(
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (data) => _buildPage(),
                empty: () => const Center(child: Text('No Data Found')),
                error: (message) => Center(child: Text(message)),
              ),
            ),



            // Container(
            //     width: double.maxFinite,
            //     padding: EdgeInsets.symmetric(vertical: 24.v),
            //     child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           _buildDropDown(context),
            //           SizedBox(height: 52.v),
            //           Padding(
            //               padding: EdgeInsets.only(left: 40.h),
            //               child: Text("lbl_ui".tr,
            //                   style: theme.textTheme.titleMedium)),
            //           SizedBox(height: 10.v),
            //           _buildAppsConfigurationList(),
            //           SizedBox(height: 30.v),
            //           _buildStaticIp(context),
            //           Spacer(),
            //           CustomOutlinedButton(
            //               text: "lbl_next".tr,
            //               margin: EdgeInsets.only(left: 27.h, right: 33.h),
            //               buttonStyle: CustomButtonStyles.outlinePrimary,
            //               alignment: Alignment.center)
            //         ]))


        ));
  }

  _buildPage()
  {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 24.v),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDropDown(context),
              SizedBox(height: 52.v),
              Padding(
                  padding: EdgeInsets.only(left: 40.h),
                  child: Text("lbl_ui".tr,
                      style: theme.textTheme.titleMedium)),
              SizedBox(height: 10.v),
              _buildAppUIDataList(),
              SizedBox(height: 30.v),
              _buildStaticIp(context),
              Spacer(),
              CustomOutlinedButton(
                  text: "lbl_next".tr,
                  margin: EdgeInsets.only(left: 27.h, right: 33.h),
                  buttonStyle: CustomButtonStyles.outlinePrimary,
                  alignment: Alignment.center)
            ]));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 40.h, top: 23.v, bottom: 20.v),
        ),
        centerTitle: true,
        title: AppbarTitle(
            // text: "lbl_AppsConfiguration".tr
            text: ref.watch(homeNotifier).selectedApp!.name,
        ));
  }

  Widget _buildDropDown(BuildContext context) {
    var model=ref
        .watch(appsConfigurationAppNotifier)
        .appsConfigurationListResponse!.dataResponse!.first;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 28.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Consumer(builder: (context, ref, _) {
            return CustomDropDownSearch(
                // title: "lbl_ticker".tr,
                title: model.id,
                // hintText: "lbl_aapl".tr,
                hintText:"Select",

                alignment: Alignment.centerRight,
                items: model
                    .dropdownData!,
                onChanged: (value) {
                  selectedDropDownValue = value;
                });
          })
        ]));
  }

  Widget _buildAppUIDataList() {
    var model=ref
        .watch(appsConfigurationAppNotifier)
        .appsConfigurationListResponse!.dataResponse![1];
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount:model.uiDataList!
                              .length ??0,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              bool active = index == currentPage;

              late UiDataModel uiDataModel=model.uiDataList![index];

              return Center(
                child: AppsConfigurationListItemWidget(
                  uiDataModel : uiDataModel,
                  isSelected: active,
                  onSelectedChanged: (_) {
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildStaticIp(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.h),
        child: Consumer(builder: (context, ref, _) {
          return CustomTextFormField(
              title: "lbl_static_ip".tr,
              controller: ref.watch(appsConfigurationAppNotifier).editTextController,
              textInputAction: TextInputAction.done,
              alignment: Alignment.centerRight);
        }));
  }
}
