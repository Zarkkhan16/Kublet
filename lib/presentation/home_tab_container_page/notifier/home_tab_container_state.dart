part of 'home_tab_container_notifier.dart';

class HomeTabContainerState extends Equatable {
  HomeTabContainerState({this.homeTabContainerModelObj,this.tabLabels,this.selectedIndex});

  HomeTabContainerModel? homeTabContainerModelObj;

   List<String>? tabLabels = [];
    int? selectedIndex=0;
  @override
  List<Object?> get props => [
    homeTabContainerModelObj,
    tabLabels,
    selectedIndex,
  ];

  HomeTabContainerState copyWith(
      {HomeTabContainerModel? homeTabContainerModelObj,List<String>? tabLabels, int? selectedIndex=0}) {
    return HomeTabContainerState(
      homeTabContainerModelObj:
      homeTabContainerModelObj ?? this.homeTabContainerModelObj,
      tabLabels:tabLabels??this.tabLabels,
      selectedIndex: selectedIndex??this.selectedIndex
    );
  }
}
