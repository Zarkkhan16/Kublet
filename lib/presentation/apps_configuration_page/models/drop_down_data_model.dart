class DropdownDataModel {
  String? id;
  String? symbol;
  String? name;

  DropdownDataModel({this.id, this.symbol, this.name});

  factory DropdownDataModel.fromJson(Map<String, dynamic> json) {
    return DropdownDataModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'symbol': symbol,
      'name': name,
    };


    return data;
  }
}