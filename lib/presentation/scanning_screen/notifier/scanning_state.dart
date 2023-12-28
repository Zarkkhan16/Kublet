part of 'scanning_notifier.dart';
class ScanningState extends Equatable {
  ScanningState({this.scanningModelObj});

  ScanningModel? scanningModelObj;

  @override
  List<Object?> get props => [
        scanningModelObj,
      ];

  ScanningState copyWith({ScanningModel? scanningModelObj}) {
    return ScanningState(
      scanningModelObj: scanningModelObj ?? this.scanningModelObj,
    );
  }
}
