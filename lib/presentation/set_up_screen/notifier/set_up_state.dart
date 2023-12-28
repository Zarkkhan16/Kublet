part of 'set_up_notifier.dart';

class SetUpState extends Equatable {
  SetUpState({this.setUpModelObj});

  SetUpModel? setUpModelObj;

  @override
  List<Object?> get props => [
        setUpModelObj,
      ];

  SetUpState copyWith({SetUpModel? setUpModelObj}) {
    return SetUpState(
      setUpModelObj: setUpModelObj ?? this.setUpModelObj,
    );
  }
}
