import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/stocks_page/models/stocksList_item_model.dart';
import 'package:kublet/presentation/stocks_page/notifier/stocks_notifier.dart';
import 'package:kublet/presentation/stocks_page/widgets/stockslist_item_widget.dart';
import 'package:kublet/widgets/app_bar/appbar_leading_image.dart';
import 'package:kublet/widgets/app_bar/appbar_title.dart';
import 'package:kublet/widgets/app_bar/custom_app_bar.dart';
import 'package:kublet/widgets/buttons/custom_outlined_button.dart';
import 'package:kublet/widgets/custom_text_form_field.dart';
import 'package:kublet/widgets/drop_downs/custom_drop_down.dart';

class StocksScreen extends ConsumerStatefulWidget {
  const StocksScreen({Key? key}) : super(key: key);

  @override
  SelectedAppPageState createState() => SelectedAppPageState();
}

class SelectedAppPageState extends ConsumerState<StocksScreen> {
  final PageController pageController = PageController(viewportFraction: 0.45,);
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
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

  late SelectionPopupModel selectedDropDownValue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
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

                      _buildStocksList(),

                      SizedBox(height: 30.v),
                      _buildStaticIp(context),
                      Spacer(),
                      CustomOutlinedButton(
                          text: "lbl_next".tr,
                          margin: EdgeInsets.only(left: 27.h, right: 33.h),
                          buttonStyle: CustomButtonStyles.outlinePrimary,
                          alignment: Alignment.center)
                    ]))));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 46.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 40.h, top: 23.v, bottom: 20.v),
        ),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_stocks".tr));
  }

  Widget _buildDropDown(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 28.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Consumer(builder: (context, ref, _) {
            return CustomDropDown(
              title: "lbl_ticker".tr,
                hintText: "lbl_aapl".tr,
                alignment: Alignment.centerRight,
                items: ref
                        .watch(stocksAppNotifier)
                        .stocksModelObj
                        ?.dropdownItemList ??
                    [],
                onChanged: (value) {
                  selectedDropDownValue = value;
                });
          })
        ]));
  }

  Widget _buildStocksList() {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: ref.watch(stocksAppNotifier)
                              .stocksModelObj
                              ?.stockslistItemList
                              .length ??0,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              bool active = index == currentPage;

              StocksListItemModel model = ref
                      .watch(stocksAppNotifier)
                      .stocksModelObj
                      ?.stockslistItemList[index] ??
                  StocksListItemModel();

              return Center(
                child: StocksListItemWidget(
                  stocksListtemModelObj : model, // Replace with your actual model
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
              title:"lbl_static_ip".tr,
              controller: ref.watch(stocksAppNotifier).editTextController,
              textInputAction: TextInputAction.done,
              alignment: Alignment.centerRight);
        }));
  }


}
