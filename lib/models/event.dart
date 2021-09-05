class Event {
  int? id;
  String? title;
  String? time;
  String? notes;
  int? classId;

  String? createdAt;
  String? updatedAt;

  Event({
    this.id,
    this.title,
    this.time,
    this.notes,
    this.classId,
    this.createdAt,
    this.updatedAt,
  });

  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        time = json['time'],
        notes = json['notes'],
        classId = json['class_id'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['time'] = this.time;
    data['notes'] = this.notes;
    data['class_id'] = this.classId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
