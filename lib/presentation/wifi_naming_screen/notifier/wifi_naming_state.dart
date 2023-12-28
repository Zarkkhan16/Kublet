part of 'wifi_naming_notifier.dart';

class WifiNamingState extends Equatable {
  WifiNamingState({
    this.wifiNameController,
    this.wifiModelObj,
  });

  TextEditingController? wifiNameController;


  WifiModel? wifiModelObj;

  @override
  List<Object?> get props => [
        wifiNameController,
        wifiModelObj,
      ];

  WifiNamingState copyWith({
    TextEditingController? wifiNameController,

    WifiModel? wifiModelObj,
  }) {
    return WifiNamingState(
      wifiNameController:
          wifiNameController ?? this.wifiNameController,

      wifiModelObj: wifiModelObj ?? this.wifiModelObj,
    );
  }
}
