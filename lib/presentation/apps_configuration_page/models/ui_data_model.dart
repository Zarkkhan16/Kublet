class UiDataModel {
  String? imgUrl;
  String? firmwareUrl;

  UiDataModel({this.imgUrl, this.firmwareUrl});

  factory UiDataModel.fromJson(Map<String, dynamic> json) {
    return UiDataModel(
      imgUrl: json['img_url'],
      firmwareUrl: json['firmware_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'img_url': imgUrl,
      'firmware_url': firmwareUrl,
    };

    return data;
  }
}
