class DynamicviewlistItemModel {
  DynamicviewlistItemModel({
    this.openApiText,
    this.openApiText1,
    this.sendDataText,
    this.sendDataText1,
    this.id,
  }) {
    openApiText = openApiText ?? "";
    openApiText1 = openApiText1 ?? "";
    sendDataText = sendDataText ?? "";
    sendDataText1 = sendDataText1 ?? "";
    id = id ?? "";
  }

  String? openApiText;

  String? openApiText1;

  String? sendDataText;

  String? sendDataText1;

  String? id;
}
