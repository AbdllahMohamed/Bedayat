class Teacher {
  int? id;
  String? arabicName;
  String? englishName;
  String? arabicDescription;
  String? englishDescription;
  bool? availability;
  String? profileImg;
  int? classId;
  String? createdAt;
  String? updatedAt;

  Teacher({
    this.id,
    this.arabicName,
    this.englishName,
    this.arabicDescription,
    this.englishDescription,
    this.availability,
    this.profileImg,
    this.classId,
    this.createdAt,
    this.updatedAt,
  });

  Teacher.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        arabicName = json['arabic_name'],
        arabicDescription = json['arabic_description'],
        englishName = json['english_name'],
        englishDescription = json['english_description'],
        availability = json['availability'],
        profileImg = json['profile_img'],
        classId = json['class_id'],
        updatedAt = json['updated_at'],
        createdAt = json['created_at'];

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   data['profile_img'] = this.profileImg;
  //   data['availability'] = this.availability;
  //   data['class_id'] = this.classId;
  //   data['created_at'] = this.updatedAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}
