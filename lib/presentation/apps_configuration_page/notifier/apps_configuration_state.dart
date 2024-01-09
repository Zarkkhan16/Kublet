import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kublet/data/models/response_model/data_response_model.dart';
import 'package:kublet/presentation/apps_configuration_page/models/apps_configuration_model.dart';

class AppsConfigurationState extends Equatable {
  AppsConfigurationState(
      {this.editTextController,
      this.appsConfigurationListResponse,
      this.appConfigurationModel,
      this.loading});

  TextEditingController? editTextController;

  AppConfigurationModel? appConfigurationModel;
  final DataResponseModel<List<AppConfigurationModel>>?
      appsConfigurationListResponse;

  bool? loading;

  @override
  List<Object?> get props => [
        editTextController,
        appsConfigurationListResponse,
        appConfigurationModel,
        loading
      ];

  AppsConfigurationState copyWith({
    TextEditingController? editTextController,
    AppConfigurationModel? appConfigurationModel,
    bool? loading,
    DataResponseModel<List<AppConfigurationModel>>?
        appsConfigurationListResponse,
  }) {
    return AppsConfigurationState(
      appsConfigurationListResponse:
          appsConfigurationListResponse ?? this.appsConfigurationListResponse,
      appConfigurationModel:
          appConfigurationModel ?? this.appConfigurationModel,
      loading: loading ?? this.loading,
    );
  }
}
