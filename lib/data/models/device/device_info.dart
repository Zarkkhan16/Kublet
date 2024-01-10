class DeviceInfo {
  String? deviceIdentifier;
  String? deviceName;
  String? deviceUpdatedName;

  DeviceInfo({
    this.deviceIdentifier,
    this.deviceName,
    this.deviceUpdatedName,
  });

  Map<String, dynamic> toJson() {
    return {
      'deviceIdentifier': deviceIdentifier,
      'deviceName': deviceName,
      'deviceUpdatedName': deviceUpdatedName,
    };
  }

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      deviceIdentifier: json['deviceIdentifier']??'',
      deviceName: json['deviceName']??'',
      deviceUpdatedName: json['deviceUpdatedName']??'',
    );
  }

}
