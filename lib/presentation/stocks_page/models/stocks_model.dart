import 'package:equatable/equatable.dart';
import 'package:kublet/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:kublet/presentation/stocks_page/models/stocksList_item_model.dart';

class StocksModel extends Equatable {
  StocksModel({
    this.dropdownItemList = const [],
    this.stockslistItemList = const [],
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<StocksListItemModel> stockslistItemList;

  StocksModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<StocksListItemModel>? selectedapplistItemList,
  }) {
    return StocksModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      stockslistItemList:
          selectedapplistItemList ?? this.stockslistItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList, stockslistItemList];
}
