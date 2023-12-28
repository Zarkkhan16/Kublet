import 'package:equatable/equatable.dart';
import '../models/bottom_manu_model.dart';

class BottomMenuState extends Equatable {
  final List<BottomMenuModel> bottomMenuList;
  final int selectedIndex;

  BottomMenuState({required this.bottomMenuList, this.selectedIndex = 0});

  @override
  List<Object?> get props => [bottomMenuList, selectedIndex];

  BottomMenuState copyWith({
    List<BottomMenuModel>? bottomMenuList,
    int? selectedIndex,
  }) {
    return BottomMenuState(
      bottomMenuList: bottomMenuList ?? this.bottomMenuList,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
