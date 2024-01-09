part of 'home_tab_container_notifier.dart';

class HomeTabContainerState extends Equatable {
  HomeTabContainerState({
    this.tagsResponse,
    this.selectedIndex,
  });

  final DataResponseModel<List<String>>? tagsResponse;

  int? selectedIndex = 0;

  @override
  List<Object?> get props => [
        tagsResponse,
        selectedIndex,
      ];

  HomeTabContainerState copyWith(
      {final DataResponseModel<List<String>>? tagsResponse,
      List<String>? tabLabels,
      int? selectedIndex = 0}) {
    return HomeTabContainerState(
        tagsResponse: tagsResponse ?? this.tagsResponse,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
