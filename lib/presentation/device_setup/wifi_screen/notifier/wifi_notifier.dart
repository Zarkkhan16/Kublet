import 'package:flutter/material.dart';
import 'package:kublet/core/helper/api_helper/uid_helper.dart';
import 'package:kublet/core/utils/app_utils.dart';
import 'package:kublet/data/models/device/device_info.dart';
import 'package:kublet/data/models/device/device_model.dart';
import 'package:kublet/data/models/wifi_info/wifi_info.dart';
import 'package:kublet/presentation/edit_wifi_screen/notifier/wifi_notifier.dart';
import 'package:kublet/services/sq_lite_service/device_sq_lite_service.dart';
import 'package:kublet/services/sq_lite_service/wifi_sq_lite_service.dart';

import '/core/app_export.dart';

final wifiNotifier = StateNotifierProvider<WifiNotifier, WifiState>((ref) =>
    WifiNotifier(WifiState(
        ssidController: TextEditingController(),
        passwordController: TextEditingController(),
        loading: false)));

class WifiNotifier extends StateNotifier<WifiState> {
  WifiNotifier(WifiState state) : super(state);

  final _deviceSqLiteService = DeviceSqliteService();
  final _wifiSqLiteService = WifiSqliteService();

  void onTapScreenTitle(String routeName) =>
      NavigatorService.pushNamed(routeName);

  //this  will store the device  info first and after success will store wifi info
  Future<void> saveDeviceInfo(DeviceInfo? deviceInfo) async {
    try {
      if (_validation() == false) return;

      state = state.copyWith(loading: true);

      String uid = await UidHelper.generateUniqueId();
      deviceInfo!.deviceIdentifier = uid;

      var deviceModel = DeviceModel(deviceInfo: deviceInfo);
      int id = await _deviceSqLiteService.storeDevice(deviceModel);

      if (id != null) {
        await PrefUtils().setCurrentDeviceId(id);

        storeWifiInfo();
        return;
      } else {
        showErrorToast();
      }
    } catch (e) {
      showErrorToast();
    }
  }

  //storing wifi info after saveDeviceInfo
  Future<void> storeWifiInfo() async {
    try {
      WifiInfo wifiInfo = WifiInfo(
          ssid: state.ssidController!.text,
          password: state.passwordController!.text);

      int id = await _wifiSqLiteService.storeWifiInfo(wifiInfo);

      state = state.copyWith(loading: false);

      if (id != null) {
        onTapScreenTitle(AppRoutes.homeContainerScreen);
        return;
      } else {
        showErrorToast();
      }
    } catch (e) {
      showErrorToast();
    }
  }

  bool? _validation() {
    if (state.ssidController!.text.isEmpty ||
        state.passwordController!.text.isEmpty) {
      AppUtils.showToastMessage("All fields must be filled");
      return false;
    } else {
      return true;
    }
  }

  void showErrorToast() {
    state = state.copyWith(loading: false);
    AppUtils.showToastMessage("Something went wrong, please try again later");
  }
}
