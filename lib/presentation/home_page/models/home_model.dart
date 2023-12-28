
import 'package:equatable/equatable.dart';
import 'dynamicviewlist_item_model.dart';

class HomeModel extends Equatable {
  HomeModel({this.dynamicviewlistItemList = const []}) {}

  List<DynamicviewlistItemModel> dynamicviewlistItemList;

  HomeModel copyWith(
      {List<DynamicviewlistItemModel>? dynamicviewlistItemList}) {
    return HomeModel(
      dynamicviewlistItemList:
          dynamicviewlistItemList ?? this.dynamicviewlistItemList,
    );
  }

  @override
  List<Object?> get props => [dynamicviewlistItemList];
}
