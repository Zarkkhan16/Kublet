import 'package:flutter/material.dart';
import 'package:kublet/presentation/stocks_page/models/stocksList_item_model.dart';
import 'package:kublet/presentation/stocks_page/models/stocks_model.dart';
import 'package:kublet/presentation/stocks_page/notifier/stocks_state.dart';
import '/core/app_export.dart';

final stocksAppNotifier =
    StateNotifierProvider<StocksAppNotifier, StocksState>((ref) =>
        StocksAppNotifier(StocksState(
            editTextController: TextEditingController(),
            selectedDropDownValue: SelectionPopupModel(title: ''),
            stocksModelObj: StocksModel(
                dropdownItemList: [
                  SelectionPopupModel(
                      id: 1, title: "Item One", isSelected: true),
                  SelectionPopupModel(id: 2, title: ""),
                  SelectionPopupModel(id: 3, title: ""),
                  SelectionPopupModel(id: 3, title: ""),
                ],
               stockslistItemList:
                    List.generate(3, (index) => StocksListItemModel())))));

class StocksAppNotifier extends StateNotifier<StocksState> {
  StocksAppNotifier(StocksState state) : super(state);
}
