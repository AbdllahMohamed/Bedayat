class Media {
  Media({
    required this.id,
    required this.img,
    required this.createdAt,
  });
  late final int id;
  late final String img;
  late final String createdAt;

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['img'] = img;
    _data['created_at'] = createdAt;
    return _data;
  }
}
