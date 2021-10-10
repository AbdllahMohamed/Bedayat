class Branch {
  int? id;
  String? arabicTitle;
  String? englistTitle;
  String? longitude;
  String? latitude;
  String? createdAt;
  String? updatedAt;

  Branch({
    this.id,
    this.arabicTitle,
    this.englistTitle,
    this.longitude,
    this.latitude,
    this.createdAt,
    this.updatedAt,
  });

  Branch.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        arabicTitle = json['arabic_title'],
        englistTitle = json['english_title'],
        longitude = json['longitude'],
        latitude = json['Latitude'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['arabic_title'] = this.arabicTitle;
    data['longitude'] = this.longitude;
    data['Latitude'] = this.latitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
