import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kublet/presentation/device_setup/scanning_screen/models/scanning_model.dart';
import '/core/app_export.dart';
part 'scanning_state.dart';

final scanningNotifier = StateNotifierProvider<ScanningNotifier, ScanningState>(
    (ref) =>
        ScanningNotifier(
            ScanningState(
              scanningModel: ScanningModel(
                deviceList:  ["Kublet 1","Kublet 2","Kublet 3"],
                selectedDevice: "Kublet 1"
              ),


        )));

class ScanningNotifier extends StateNotifier<ScanningState> {
  ScanningNotifier(ScanningState state) : super(state);


  void onTapScreenTitle(String routeName) =>NavigatorService.pushNamed(routeName);

  Future<void> connectAndMoveToNextScreen(BuildContext context) async {
    state = state.copyWith(connecting: true);

    await Future.delayed(Duration(seconds:2));

    onTapScreenTitle(AppRoutes.deviceNamingScreen);
    state = state.copyWith(connecting: false);

  }


  void updateSelectedDevice(String? device) {
    state = state.copyWith(selectedDevice: device);

  }


}
