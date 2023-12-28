import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kublet/presentation/wifi_screen/models/wifi_model.dart';
part 'wifi_naming_state.dart';

final wifiNamingNotifier = StateNotifierProvider<WifiNamingNotifier, WifiNamingState>((ref) =>
    WifiNamingNotifier(WifiNamingState(
        wifiNameController: TextEditingController(),
        wifiModelObj: WifiModel())));

class WifiNamingNotifier extends StateNotifier<WifiNamingState> {
  WifiNamingNotifier(WifiNamingState state) : super(state);
  void onTapScreenTitle(String routeName) => NavigatorService.pushNamed(routeName);

}
