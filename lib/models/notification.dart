class Notifications {
  int? id;
  String? content;
  String? title;
  int? userId;
  int? childId;

  String? createdAt;
  String? updatedAt;

  Notifications({
    this.id,
    this.content,
    this.title,
    this.userId,
    this.childId,
    this.createdAt,
    this.updatedAt,
  });

  Notifications.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['content'],
        title = json['title'],
        userId = json['user_id'],
        childId = json['child_id'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['title'] = this.title;
    data['user_id'] = this.userId;
    data['child_id'] = this.childId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
