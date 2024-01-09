import 'package:flutter/material.dart';
import 'package:kublet/core/helper/api_helper/uid_helper.dart';
import 'package:kublet/core/utils/app_utils.dart';
import 'package:kublet/data/models/device_configuration/device_configuration_model.dart';
import 'package:kublet/presentation/edit_wifi_screen/notifier/wifi_notifier.dart';
import 'package:kublet/services/sq_lite_service/sq_lite_service.dart';

import '/core/app_export.dart';

final wifiNotifier = StateNotifierProvider<WifiNotifier, WifiState>((ref) =>
    WifiNotifier(WifiState(
        ssidController: TextEditingController(),
        passwordController: TextEditingController())));

class WifiNotifier extends StateNotifier<WifiState> {
  WifiNotifier(WifiState state) : super(state);

  final _sqLiteService = SqliteService();

  void onTapScreenTitle(String routeName) =>
      NavigatorService.pushNamed(routeName);

  Future<void> saveDeviceInfo(
      DeviceConfigurationModel? configurationModel) async {
    if (_validation() == false) return;

    state = state.copyWith(loading: true);

    String uid = await UidHelper.generateUniqueId();

    await PrefUtils().setCurrentDeviceUid(uid);

    configurationModel!.deviceIdentifier = uid;
    int id = await _sqLiteService.createItem(configurationModel);

    state = state.copyWith(loading: false);

    if (id != null) {
      onTapScreenTitle(AppRoutes.homeContainerScreen);
      return;
    } else {
      AppUtils.showToastMessage("Something went Wrong,please try again later");
      return;
    }
  }

  bool? _validation() {
    if (state.ssidController!.text.isEmpty ||
        state.passwordController!.text.isEmpty) {
      AppUtils.showToastMessage("All the fields must be filled");
      return false;
    } else {
      return true;
    }
  }
}
