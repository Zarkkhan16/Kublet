import 'package:flutter/material.dart';
import 'package:kublet/presentation/device_setup/device_naming_screen/notifier/device_naming_state.dart';
import '/core/app_export.dart';

final deviceNamingNotifier = StateNotifierProvider<DeviceNamingNotifier, DeviceNamingState>((ref) =>
    DeviceNamingNotifier(DeviceNamingState(
        deviceNameController: TextEditingController(),
       )));

class DeviceNamingNotifier extends StateNotifier<DeviceNamingState> {
  DeviceNamingNotifier(DeviceNamingState state) : super(state);
  void onTapScreenTitle(String routeName) => NavigatorService.pushNamed(routeName);


  void updateDeviceName(String? deviceName) {
    state = state.copyWith(wifiNameController:TextEditingController(text: deviceName) );

  }

}
