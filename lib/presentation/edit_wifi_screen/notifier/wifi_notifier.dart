import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
part 'wifi_state.dart';

final editWifiNotifier = StateNotifierProvider<EditWifiNotifier, WifiState>((ref) =>
    EditWifiNotifier(WifiState(
        wifiNameController: TextEditingController(),
        ssidController: TextEditingController(),
        passwordController: TextEditingController(),
        )));

class EditWifiNotifier extends StateNotifier<WifiState> {
  EditWifiNotifier(WifiState state) : super(state);
}
