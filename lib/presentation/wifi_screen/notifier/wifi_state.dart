part of 'wifi_notifier.dart';

class WifiState extends Equatable {
  WifiState({
    this.wifiNameController,
    this.ssidController,
    this.passwordController,
    this.wifiModelObj,
  });

  TextEditingController? wifiNameController;

  TextEditingController? ssidController;

  TextEditingController? passwordController;

  WifiModel? wifiModelObj;

  @override
  List<Object?> get props => [
        wifiNameController,
        ssidController,
        passwordController,
        wifiModelObj,
      ];

  WifiState copyWith({
    TextEditingController? wifiNameController,
    TextEditingController? ssidController,
    TextEditingController? passwordController,
    WifiModel? wifiModelObj,
  }) {
    return WifiState(
      wifiNameController:
          wifiNameController ?? this.wifiNameController,
      ssidController: ssidController ?? this.ssidController,
      passwordController:
          passwordController ?? this.passwordController,
      wifiModelObj: wifiModelObj ?? this.wifiModelObj,
    );
  }
}
