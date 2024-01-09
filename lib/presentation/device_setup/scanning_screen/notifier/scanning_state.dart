part of 'scanning_notifier.dart';

class ScanningState extends Equatable {
  final ScanningModel scanningModel;

  ScanningState({required this.scanningModel,});

  @override
  List<Object?> get props => [scanningModel,];

  ScanningState copyWith({
    bool? connecting,
    List<String>? deviceList,
    String? selectedDevice,
  }) {
    return ScanningState(
      scanningModel: scanningModel.copyWith(
        connecting: connecting,
        deviceList: deviceList,
        selectedDevice: selectedDevice,
      ),

    );
  }
}
