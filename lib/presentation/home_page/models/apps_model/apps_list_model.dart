import 'package:kublet/data/models/apps/app_model.dart';

class AppsListModel {
  List<AppModel> apps;

  AppsListModel({required this.apps});

  factory AppsListModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> appsList = json['apps'];
    List<AppModel> apps = appsList.map((appJson) => AppModel.fromJson(appJson)).toList();
    return AppsListModel(apps: apps);
  }
}

