import 'dart:convert';

import 'package:kublet/data/models/apps/app_data_model.dart';
import 'package:kublet/data/models/device/device_info.dart';

class DeviceModel {
  int? id;
  DeviceInfo? deviceInfo;
  // WifiInfo? wifiInfo;
  AppDataModel? appData;
  DateTime? createdOn;

  DeviceModel({
    this.id,
    this.deviceInfo,
    this.appData,
    this.createdOn,
  });

  // factory DeviceModel.fromJson(Map<String, dynamic> json) {
  //   return DeviceModel(
  //     id: json['id'],
  //     deviceInfo: json['device_info'] == null ? DeviceInfo() :
  //     DeviceInfo.fromJson(json['device_info']),
  //     appData: json['app_data'] == null ? AppDataModel()
  //         : AppDataModel.fromJson(json['app_data']),
  //     createdOn: json['created_on'] == null ? null : DateTime.parse(json['created_on']),
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'device_info': deviceInfo?.toJson() ?? DeviceInfo().toJson(),
  //     'app_data': appData?.toJson() ?? AppDataModel().toJson(),
  //     'created_on': createdOn?.toIso8601String(),
  //   };
  // }

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      id: json['id'],
      deviceInfo: json['device_info'] == null
          ? DeviceInfo()
          : DeviceInfo.fromJson(jsonDecode(json['device_info'])),
      appData: json['app_data'] == null
          ? AppDataModel()
          : AppDataModel.fromJson(jsonDecode(json['app_data'])),
      createdOn: json['created_on'] == null
          ? null
          : DateTime.parse(json['created_on']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'device_info': jsonEncode(deviceInfo?.toJson() ?? DeviceInfo().toJson()),
      'app_data': jsonEncode(appData?.toJson() ?? AppDataModel().toJson()),
      'created_on': createdOn?.toIso8601String(),
    };
  }

}
