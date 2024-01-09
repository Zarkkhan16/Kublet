class DeviceConfigurationModel {
  String? deviceIdentifier;
  String? deviceName;
  String? deviceUpdatedName;
  String? ssidName;
  String? ssidPassword;
  String? appId;
  String? tickerId;
  String? tickerName;
  String? tickerSymbol;
  String? uiImage;
  String? uiFirmware;

  DeviceConfigurationModel({
    this.deviceIdentifier,
    this.deviceName,
    this.deviceUpdatedName,
    this.ssidName,
    this.ssidPassword,
    this.appId,
    this.tickerId,
    this.tickerName,
    this.tickerSymbol,
    this.uiImage,
    this.uiFirmware,
  });

  factory DeviceConfigurationModel.fromJson(Map<String, dynamic> json) {
    return DeviceConfigurationModel(
      deviceIdentifier: json['device_identifier'] ?? '',
      deviceName: json['device_name'] ?? '',
      deviceUpdatedName: json['device_updated_name'] ?? '',
      ssidName: json['ssid_name'] ?? '',
      ssidPassword: json['ssid_password'] ?? '',
      appId: json['app_id'] ?? '',
      tickerId: json['ticker_id'] ?? '',
      tickerName: json['ticket_name'] ?? '',
      tickerSymbol: json['ticker_symbol'] ?? '',
      uiImage: json['ui_image'] ?? '',
      uiFirmware: json['ui_firmware'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'device_identifier': deviceIdentifier,
      'device_name': deviceName,
      'device_updated_name': deviceUpdatedName,
      'ssid_name': ssidName,
      'ssid_password': ssidPassword,
      'app_id': appId,
      'ticker_id': tickerId,
      'ticket_name': tickerName,
      'ticker_symbol': tickerSymbol,
      'ui_image': uiImage,
      'ui_firmware': uiFirmware,
    };
  }
}
