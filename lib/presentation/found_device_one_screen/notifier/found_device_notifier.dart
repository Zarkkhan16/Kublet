import 'package:flutter/material.dart';
import 'package:kublet/presentation/found_device_one_screen/models/found_device_model.dart';
import 'package:kublet/presentation/found_device_one_screen/notifier/found_device_state.dart';
import '/core/app_export.dart';


final foundDeviceNotifier = StateNotifierProvider<FoundDeviceNotifier, FoundDeviceState>(
      (ref) => FoundDeviceNotifier(FoundDeviceState(foundDeviceModelObj: FoundDeviceModel())),
);

class FoundDeviceNotifier extends StateNotifier<FoundDeviceState> {
  FoundDeviceNotifier(FoundDeviceState state) : super(state);

  Future<void> connectAndMoveToNextScreen(BuildContext context) async {
    state = state.copyWith(foundDeviceModelObj: state.foundDeviceModelObj!.copyWith(connecting: true));

    await Future.delayed(Duration(seconds: 1));

    onTapScreenTitle(AppRoutes.wifiNamingScreen);
  }

  void onTapScreenTitle(String routeName) => NavigatorService.pushNamed(routeName);
}
