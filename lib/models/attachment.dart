class Attachments {
  Attachments({
    required this.id,
    required this.file,
    required this.createdAt,
  });
  late final int id;
  late final String file;
  late final String createdAt;

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['file'] = file;
    _data['created_at'] = createdAt;
    return _data;
  }
}
