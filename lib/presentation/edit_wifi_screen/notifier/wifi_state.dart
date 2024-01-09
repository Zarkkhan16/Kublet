part of 'wifi_notifier.dart';

class WifiState extends Equatable {
  WifiState({
    this.wifiNameController,
    this.ssidController,
    this.passwordController,
    this.loading
  });

  TextEditingController? wifiNameController;

  TextEditingController? ssidController;

  TextEditingController? passwordController;
  bool? loading;


  @override
  List<Object?> get props => [
        wifiNameController,
        ssidController,
        passwordController,
          loading,
      ];

  WifiState copyWith({
    TextEditingController? wifiNameController,
    TextEditingController? ssidController,
    TextEditingController? passwordController,
    bool? loading

  }) {
    return WifiState(
      wifiNameController:
          wifiNameController ?? this.wifiNameController,
      ssidController: ssidController ?? this.ssidController,
      passwordController:
          passwordController ?? this.passwordController,
      loading: loading??this.loading
    );
  }
}
