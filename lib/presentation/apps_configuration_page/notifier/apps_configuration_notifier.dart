import 'package:flutter/material.dart';
import 'package:kublet/data/enum/data_response_enum.dart';
import 'package:kublet/data/models/apps/app_data_model.dart';
import 'package:kublet/data/models/device/device_model.dart';
import 'package:kublet/data/models/response_model/data_response_model.dart';
import 'package:kublet/presentation/apps_configuration_page/models/apps_configuration_model.dart';
import 'package:kublet/presentation/apps_configuration_page/notifier/apps_configuration_state.dart';
import 'package:kublet/services/apps_services/apps_service.dart';
import 'package:kublet/services/sq_lite_service/device_sq_lite_service.dart';
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
  final _deviceSqLiteService = DeviceSqliteService();

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

  Future<void> saveAppInfo(AppDataModel? appDataModel) async {
    state = state.copyWith(loading: true);
    int? id = await PrefUtils().getCurrentDeviceId();
    print(id);

    //getting current device data
    List<DeviceModel> deviceList = await _deviceSqLiteService.getDeviceList();
    print(deviceList);
    DeviceModel currentDeviceModel =
        deviceList.where((element) => element.id == id).first;


    //setting uo the  data to current data model
    print(currentDeviceModel.deviceInfo!.deviceName);
    print(currentDeviceModel.id);
    currentDeviceModel.appData = appDataModel;

    //     tickerAModel!.appData;
    // currentDeviceModel.tickerName = tickerAModel.tickerName;
    // currentDeviceModel.tickerSymbol = tickerAModel.tickerSymbol;
    // currentDeviceModel.tickerId = tickerAModel.tickerId;
    // currentDeviceModel.uiImageUrl = tickerAModel.uiImageUrl;
    // currentDeviceModel.firmwareUrl = tickerAModel.firmwareUrl;
    //

    int result =
        await _deviceSqLiteService.updateDeviceInfo(currentDeviceModel);

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
