import 'package:kublet/presentation/apps_configuration_page/models/drop_down_data_model.dart';
import 'package:kublet/presentation/apps_configuration_page/models/ui_data_model.dart';

class AppConfigurationModel {
  String? id;
  String? ticker;
  String? type;
  String? defaultText;
  List<UiDataModel>? uiDataList;
  List<DropdownDataModel>? dropdownData;
  bool? required;

  AppConfigurationModel({
    this.id,
    this.ticker,
    this.type,
    this.defaultText,
    this.uiDataList,
    this.dropdownData,
    this.required,
  });

  factory AppConfigurationModel.fromJson(Map<String, dynamic> json) {
    return AppConfigurationModel(
      id: json['id'],
      ticker: json['ticker'],
      type: json['type'],
      defaultText: json['default_text'],
      uiDataList: (json['ui_data'] as List<dynamic>?)
          ?.map((data) => UiDataModel.fromJson(data))
          .toList(),
      dropdownData: (json['dropdown_data'] as List<dynamic>?)
          ?.map((data) => DropdownDataModel.fromJson(data))
          .toList(),
      required: json['required'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'ticker': ticker,
      'type': type,
      'default_text': defaultText,
      'ui_data': uiDataList?.map((uiData) => uiData.toJson()).toList(),
      'dropdown_data':
          dropdownData?.map((dropdown) => dropdown.toJson()).toList(),
      'required': required,
    };

    return data;
  }
}
