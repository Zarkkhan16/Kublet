import 'package:flutter/material.dart';
import 'package:kublet/core/app_export.dart';
import 'package:kublet/presentation/stocks_page/models/stocksList_item_model.dart';

class StocksListItemWidget extends StatelessWidget {
  StocksListItemModel? stocksListtemModelObj;
  final bool isSelected;
  final Function(bool) onSelectedChanged;

  StocksListItemWidget(
  {  this.stocksListtemModelObj,
        required this.isSelected,
        required this.onSelectedChanged,
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isSelected ? 250.adaptSize : 144.adaptSize,
      width: isSelected ? 150.adaptSize : 144.adaptSize,
      margin: EdgeInsets.symmetric(vertical: 12.v),
      decoration: BoxDecoration(
        color: appTheme.blueGray,
        borderRadius: BorderRadius.circular(10.h),
      ),
    );
  }
}
