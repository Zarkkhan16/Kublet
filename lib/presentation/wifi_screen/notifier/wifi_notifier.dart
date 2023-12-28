import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kublet/presentation/wifi_screen/models/wifi_model.dart';
part 'wifi_state.dart';

final wifiNotifier = StateNotifierProvider<WifiNotifier, WifiState>((ref) =>
    WifiNotifier(WifiState(
        wifiNameController: TextEditingController(),
        ssidController: TextEditingController(),
        passwordController: TextEditingController(),
        wifiModelObj: WifiModel())));

class WifiNotifier extends StateNotifier<WifiState> {
  WifiNotifier(WifiState state) : super(state);
}
