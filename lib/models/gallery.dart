class Gallery {
  int? id;
  String? img;
  String? childId;
  String? notes;

  String? createdAt;
  String? updatedAt;

  Gallery({
    this.id,
    this.img,
    this.childId,
    this.createdAt,
    this.updatedAt,
  });

  Gallery.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        img = json['img'],
        childId = json['child_id'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['child_id'] = this.childId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
