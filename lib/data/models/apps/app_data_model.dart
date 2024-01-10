class AppDataModel {
  String? appId;
  String? tickerId;
  String? tickerName;
  String? tickerSymbol;
  String? uiImageUrl;
  String? firmwareUrl;

  AppDataModel({
    this.appId,
    this.tickerId,
    this.tickerName,
    this.tickerSymbol,
    this.uiImageUrl,
    this.firmwareUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'appId': appId,
      'tickerId': tickerId,
      'tickerName': tickerName,
      'tickerSymbol': tickerSymbol,
      'uiImageUrl': uiImageUrl,
      'firmwareUrl': firmwareUrl,
    };
  }

  factory AppDataModel.fromJson(Map<String, dynamic> json) {
    return AppDataModel(
      appId: json['appId']??'',
      tickerId: json['tickerId']??'',
      tickerName: json['tickerName']??'',
      tickerSymbol: json['tickerSymbol']??'',
      uiImageUrl: json['uiImageUrl']??'',
      firmwareUrl: json['firmwareUrl']??'',
    );
  }


}
