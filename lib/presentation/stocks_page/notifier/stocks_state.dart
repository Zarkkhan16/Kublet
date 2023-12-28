import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kublet/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:kublet/presentation/stocks_page/models/stocks_model.dart';

class StocksState extends Equatable {
  StocksState({
    this.editTextController,
    this.selectedDropDownValue,
    this.stocksModelObj,
  });

  TextEditingController? editTextController;

  SelectionPopupModel? selectedDropDownValue;

  StocksModel? stocksModelObj;

  @override
  List<Object?> get props => [
        editTextController,
        selectedDropDownValue,
        stocksModelObj,
      ];

  StocksState copyWith({
    TextEditingController? editTextController,
    SelectionPopupModel? selectedDropDownValue,
    StocksModel? stocksModelObj,
  }) {
    return StocksState(
      editTextController: editTextController ?? this.editTextController,
      selectedDropDownValue: selectedDropDownValue ?? this.selectedDropDownValue,
      stocksModelObj: stocksModelObj ?? this.stocksModelObj,
    );
  }
}
