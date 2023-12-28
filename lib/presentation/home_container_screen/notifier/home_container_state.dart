part of 'home_container_notifier.dart';

class HomeContainerState extends Equatable {
  HomeContainerState({this.homeContainerModelObj});

  HomeContainerModel? homeContainerModelObj;

  @override
  List<Object?> get props => [
        homeContainerModelObj,
      ];

  HomeContainerState copyWith({HomeContainerModel? homeContainerModelObj}) {
    return HomeContainerState(
      homeContainerModelObj:
          homeContainerModelObj ?? this.homeContainerModelObj,
    );
  }
}
