class Branch {
  int? id;
  String? title;
  String? longitude;
  String? latitude;
  String? createdAt;
  String? updatedAt;

  Branch({
    this.id,
    this.title,
    this.longitude,
    this.latitude,
    this.createdAt,
    this.updatedAt,
  });

  Branch.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        longitude = json['longitude'],
        latitude = json['Latitude'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['longitude'] = this.longitude;
    data['Latitude'] = this.latitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
