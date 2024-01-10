class WifiInfo {
  int? id;
  String? ssid;
  String? password;

  WifiInfo({
    this.id,
    this.ssid,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'ssid': ssid,
      'password': password,
    };
  }

  factory WifiInfo.fromJson(Map<String, dynamic> json) {
    return WifiInfo(
      id: json['id'],
      ssid: json['ssid'] ?? '',
      password: json['password'] ?? '',
    );
  }
}
