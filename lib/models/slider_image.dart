class SliderImage {
  int? id;
  String? arabicTitle;
  String? englishTitle;
  String? arabicContent;
  String? englishContent;
  String? img;
  String? updatedAt;
  String? createdAt;

  SliderImage({
    this.id,
    this.arabicTitle,
    this.englishTitle,
    this.arabicContent,
    this.englishContent,
    this.img,
    this.updatedAt,
    this.createdAt,
  });

  SliderImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arabicTitle = json['arabic_title'];
    englishTitle = json['english_title'];
    arabicContent = json['arabic_content'];
    englishContent = json['english_content'];
    img = json['img'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['content'] = this.content;
  //   data['img'] = this.img;
  //   data['updated_at'] = this.updatedAt;
  //   data['created_at'] = this.createdAt;
  //   return data;
  // }
}
