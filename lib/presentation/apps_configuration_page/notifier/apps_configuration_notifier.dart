import 'package:flutter/material.dart';
import 'package:kublet/data/enum/data_response_enum.dart';
import 'package:kublet/data/models/device_configuration/device_configuration_model.dart';
import 'package:kublet/data/models/response_model/data_response_model.dart';
import 'package:kublet/presentation/apps_configuration_page/models/apps_configuration_model.dart';
import 'package:kublet/presentation/apps_configuration_page/notifier/apps_configuration_state.dart';
import 'package:kublet/services/apps_services/apps_service.dart';
import 'package:kublet/services/sq_lite_service/sq_lite_service.dart';

import '/core/app_export.dart';

final appsConfigurationAppNotifier =
    StateNotifierProvider<AppsConfigurationAppNotifier, AppsConfigurationState>(
        (ref) => AppsConfigurationAppNotifier(AppsConfigurationState(
              appConfigurationModel: AppConfigurationModel(),
              appsConfigurationListResponse:
                  DataResponseModel<List<AppConfigurationModel>>(
                      DataResponseType.loading),
              editTextController: TextEditingController(),
            )));

class AppsConfigurationAppNotifier
    extends StateNotifier<AppsConfigurationState> {
  AppsConfigurationAppNotifier(AppsConfigurationState state) : super(state);
  final _sqLiteService = SqliteService();

  Future<void> getSelectedAppConfiguration(String selectedApp) async {
    try {
      final response =
          await AppsService.getSelectedAppConfiguration(selectedApp);
      print(response);
      if (response.isEmpty) {
        state = state.copyWith(
          appsConfigurationListResponse:
              DataResponseModel<List<AppConfigurationModel>>(
                  DataResponseType.empty),
        );
      } else {
        state = state.copyWith(
          appsConfigurationListResponse:
              DataResponseModel<List<AppConfigurationModel>>(
            DataResponseType.data,
            dataResponse: response,
          ),
        );
      }
    } catch (e) {
      state = state.copyWith(
        appsConfigurationListResponse:
            DataResponseModel<List<AppConfigurationModel>>(
          DataResponseType.error,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> saveDeviceInfo(DeviceConfigurationModel? tickerAModel) async {
    state = state.copyWith(loading: true);
    String uid = await PrefUtils().getCurrentDeviceUid();
    print(uid);

    //getting current device data
    List<DeviceConfigurationModel> id = await _sqLiteService.getItems();
    DeviceConfigurationModel currentDeviceConfigurationModel =
        id.where((element) => element.deviceIdentifier == uid).first;


    //setting uo the  data to current data model
    print(currentDeviceConfigurationModel.ssidName);
    currentDeviceConfigurationModel.appId = tickerAModel!.appId;
    currentDeviceConfigurationModel.tickerName = tickerAModel.tickerName;
    currentDeviceConfigurationModel.tickerSymbol = tickerAModel.tickerSymbol;
    currentDeviceConfigurationModel.tickerId = tickerAModel.tickerId;
    currentDeviceConfigurationModel.uiImage = tickerAModel.uiImage;
    currentDeviceConfigurationModel.uiFirmware = tickerAModel.uiFirmware;
    //

    int result =
        await _sqLiteService.updateItem(currentDeviceConfigurationModel);

    state = state.copyWith(loading: false);

    if (result != null) {
      onTapScreenTitle(AppRoutes.homeContainerScreen);
      return;
    } else {
      return;
    }
  }

  void onTapScreenTitle(String routeName) =>
      NavigatorService.pushNamed(routeName);
}
