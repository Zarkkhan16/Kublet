import 'package:dio/dio.dart';
import 'package:kublet/core/constants/apis_constants.dart';
import 'package:kublet/core/helper/api_helper/api_helper.dart';
import 'package:kublet/presentation/apps_configuration_page/models/apps_configuration_model.dart';
import 'package:kublet/presentation/home_page/models/apps_model/apps_list_model.dart';

class AppsService {
  static Future<List<String>> getTags() async {
    try {
      final headers = {
        ApiConstants.xApiKey: ApiConstants.apiValue,
      };

      final response = await ApiHelper(Dio()).get(
        '${ApiConstants.baseUrl}${ApiConstants.tagsEndpoint}',
        (dynamic json) =>
            (json as List<dynamic>).map((e) => e.toString()).toList(),
        headers: headers,
      );

      return response;
    } on DioError catch (error) {
      print('Error fetching tags: ${error.message}');
      rethrow;
    }
  }

  static Future<AppsListModel> getApps() async {
    try {
      final headers = {
        ApiConstants.xApiKey: ApiConstants.apiValue,
      };

      final response = await ApiHelper(Dio()).get(
        '${ApiConstants.baseUrl}${ApiConstants.appsEndpoint}',
        (dynamic json) => AppsListModel.fromJson(json),
        headers: headers,
      );

      return response;
    } on DioError catch (error) {
      print('Error fetching apps: ${error.message}');
      rethrow;
    }
  }

  static Future<List<AppConfigurationModel>> getSelectedAppConfiguration(
      String selectedApp) async {
    try {
      List<AppConfigurationModel> tempList = [];
      final headers = {
        ApiConstants.xApiKey: ApiConstants.apiValue,
      };

      final response = await ApiHelper(Dio()).get(
        '${ApiConstants.baseUrl}${ApiConstants.appsEndpoint}/$selectedApp',
        (dynamic json) => json.map((e) => AppConfigurationModel.fromJson(e)),
        headers: headers,
      );

      for (var list in response) {
        tempList.add(list);
      }

      return tempList;
    } on DioError catch (error) {
      print('Error fetching apps: ${error.message}');
      rethrow;
    }
  }
}
