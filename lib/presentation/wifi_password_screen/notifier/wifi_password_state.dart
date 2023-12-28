part of 'wifi_password_notifier.dart';

class WifiPasswordState extends Equatable {
  WifiPasswordState({
    this.ssidController,
    this.passwordController,
    this.wifiModelObj,
  });


  TextEditingController? ssidController;

  TextEditingController? passwordController;

  WifiModel? wifiModelObj;

  @override
  List<Object?> get props => [
        ssidController,
        passwordController,
        wifiModelObj,
      ];

  WifiPasswordState copyWith({
    TextEditingController? ssidController,
    TextEditingController? passwordController,
    WifiModel? wifiModelObj,
  }) {
    return WifiPasswordState(
      ssidController: ssidController ?? this.ssidController,
      passwordController:
          passwordController ?? this.passwordController,
      wifiModelObj: wifiModelObj ?? this.wifiModelObj,
    );
  }
}
