part of 'my_kublets_notifier.dart';
class MyKubletsState extends Equatable {
  MyKubletsState({this.myKubletsModelObj});

  MyKubletsModel? myKubletsModelObj;

  @override
  List<Object?> get props => [
        myKubletsModelObj,
      ];

  MyKubletsState copyWith({MyKubletsModel? selectedAppOneModelObj}) {
    return MyKubletsState(
      myKubletsModelObj:
          selectedAppOneModelObj ?? this.myKubletsModelObj,
    );
  }
}
