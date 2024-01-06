class AppModel {
  String id;
  String name;
  String desc;
  String info;
  String imgUrl;
  List<String> tags;

  AppModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.info,
    required this.imgUrl,
    required this.tags,
  });

  factory AppModel.fromJson(Map<String, dynamic> json) {
    return AppModel(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      info: json['info'],
      imgUrl: json['img_url'],
      tags: List<String>.from(json['tags']),
    );
  }
}
