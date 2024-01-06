import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kublet/data/models/response_model/data_response_model.dart';
import 'package:kublet/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:kublet/presentation/apps_configuration_page/models/apps_configuration_model.dart';

class AppsConfigurationState extends Equatable {
  AppsConfigurationState({
    this.editTextController,
    // this.selectedDropDownValue,
    this.appsConfigurationListResponse,
    this.appConfigurationModel,
  });
  //
  TextEditingController? editTextController;
  //
  // SelectionPopupModel? selectedDropDownValue;

  // AppsConfigurationModel? AppsConfigurationModelObj;
  AppConfigurationModel? appConfigurationModel;
  final DataResponseModel<List<AppConfigurationModel>>? appsConfigurationListResponse;


  @override
  List<Object?> get props => [
        editTextController,
        // selectedDropDownValue,
    appsConfigurationListResponse,
    appConfigurationModel,

      ];

  AppsConfigurationState copyWith({

    TextEditingController? editTextController,
    // SelectionPopupModel? selectedDropDownValue,
    AppConfigurationModel? appConfigurationModel,
    DataResponseModel<List<AppConfigurationModel>>? appsConfigurationListResponse,

  }) {
    return AppsConfigurationState(
        appsConfigurationListResponse: appsConfigurationListResponse ?? this.appsConfigurationListResponse,
        appConfigurationModel:appConfigurationModel??this.appConfigurationModel
      // editTextController: editTextController ?? this.editTextController,
      // selectedDropDownValue: selectedDropDownValue ?? this.selectedDropDownValue,
      // AppsConfigurationModelObj: AppsConfigurationModelObj ?? this.AppsConfigurationModelObj,
    );
  }
}
