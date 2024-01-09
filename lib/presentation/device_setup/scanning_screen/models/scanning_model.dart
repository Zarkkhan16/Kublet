import 'package:equatable/equatable.dart';

class ScanningModel extends Equatable {
  final bool? connecting;
  final List<String>? deviceList;
  final String? selectedDevice;

  ScanningModel({
    this.connecting,
    this.deviceList,
    this.selectedDevice,
  });

  ScanningModel copyWith({
    bool? connecting,
    List<String>? deviceList,
    String? selectedDevice,
  }) {
    return ScanningModel(
      connecting: connecting ?? this.connecting,
      deviceList: deviceList ?? this.deviceList,
      selectedDevice: selectedDevice ?? this.selectedDevice,
    );
  }

  @override
  List<Object?> get props => [connecting, deviceList, selectedDevice];
}
