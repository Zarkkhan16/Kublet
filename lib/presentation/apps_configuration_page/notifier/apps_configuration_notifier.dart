import 'package:flutter/material.dart';
import 'package:kublet/data/enum/data_response_enum.dart';
import 'package:kublet/data/models/response_model/data_response_model.dart';
import 'package:kublet/presentation/apps_configuration_page/models/apps_configuration_model.dart';
import 'package:kublet/presentation/apps_configuration_page/notifier/apps_configuration_state.dart';
import 'package:kublet/services/apps_services/apps_service.dart';
import '/core/app_export.dart';

final appsConfigurationAppNotifier =
    StateNotifierProvider<AppsConfigurationAppNotifier, AppsConfigurationState>((ref) =>
        AppsConfigurationAppNotifier(AppsConfigurationState(
          appConfigurationModel: AppConfigurationModel(),
            appsConfigurationListResponse: DataResponseModel<List<AppConfigurationModel>>(DataResponseType.loading),
            editTextController: TextEditingController(),
            // selectedDropDownValue: SelectionPopupModel(title: ''),
            // AppsConfigurationModelObj: AppsConfigurationModel(
            //     dropdownItemList: [
            //       SelectionPopupModel(
            //           id: 1, title: "Item One", isSelected: true),
            //       SelectionPopupModel(id: 2, title: ""),
            //       SelectionPopupModel(id: 3, title: ""),
            //       SelectionPopupModel(id: 3, title: ""),
            //     ],
            //    AppsConfigurationlistItemList:
            //         List.generate(3, (index) => AppsConfigurationListItemModel()))

        )

        ));

class AppsConfigurationAppNotifier extends StateNotifier<AppsConfigurationState> {
  AppsConfigurationAppNotifier(AppsConfigurationState state) : super(state);

  Future<void> getSelectedAppConfiguration(String selectedApp) async {
    try {
      final response = await AppsService.getSelectedAppConfiguration(selectedApp);
            print(response);
      if (response.isEmpty) {
        state = state.copyWith(
          appsConfigurationListResponse:
          DataResponseModel<List<AppConfigurationModel>>(DataResponseType.empty),
        );
      } else {
        state = state.copyWith(
          appsConfigurationListResponse: DataResponseModel<List<AppConfigurationModel>>(
            DataResponseType.data,
            dataResponse: response,
          ),
        );
      }
    } catch (e) {

      state = state.copyWith(
        appsConfigurationListResponse: DataResponseModel<List<AppConfigurationModel>>(
          DataResponseType.error,
          message: e.toString(),
        ),
      );
    }
  }
}
