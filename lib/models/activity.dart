class Activity {
  Activity({
    required this.id,
    required this.arabicTitle,
    required this.englishTitle,
    required this.arabicDescription,
    required this.englishDescription,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final String arabicTitle;
  late final String englishTitle;
  late final String arabicDescription;
  late final String englishDescription;
  late final bool isActive;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arabicTitle = json['arabic_title'];
    englishTitle = json['english_title'];
    arabicDescription = json['arabic_description'];
    englishDescription = json['english_description'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['arabic_title'] = arabicTitle;
    _data['english_title'] = englishTitle;
    _data['arabic_description'] = arabicDescription;
    _data['english_description'] = englishDescription;
    _data['is_active'] = isActive;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}
