import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kublet/presentation/wifi_screen/models/wifi_model.dart';
part 'wifi_password_state.dart';

final wifiPasswordNotifier = StateNotifierProvider<WifiPasswordNotifier, WifiPasswordState>((ref) =>
    WifiPasswordNotifier(WifiPasswordState(
        passwordController: TextEditingController(),
        wifiModelObj: WifiModel())));

class WifiPasswordNotifier extends StateNotifier<WifiPasswordState> {
  WifiPasswordNotifier(WifiPasswordState state) : super(state);
}
