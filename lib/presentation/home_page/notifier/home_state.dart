part of 'home_notifier.dart';

class HomeState extends Equatable {
  HomeState({this.homeModelObj});

  HomeModel? homeModelObj;

  @override
  List<Object?> get props => [
        homeModelObj,
      ];

  HomeState copyWith({HomeModel? homeModelObj}) {
    return HomeState(
      homeModelObj: homeModelObj ?? this.homeModelObj,
    );
  }
}
