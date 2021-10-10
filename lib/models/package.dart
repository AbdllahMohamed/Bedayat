class Package {
  int? id;
  String? arabicTitle;
  String? englishTitle;
  String? arabicDescription;
  String? englishDescription;
  String? price;
  String? period;
  int? numberOfMonths;
  String? tax;

  String? createdAt;
  String? updatedAt;

  Package({
    this.id,
    this.arabicTitle,
    this.englishTitle,
    this.arabicDescription,
    this.englishDescription,
    this.price,
    this.period,
    this.tax,
    this.numberOfMonths,
    this.createdAt,
    this.updatedAt,
  });

  Package.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        arabicTitle = json['arabic_title'],
        englishTitle = json['english_title'],
        arabicDescription = json['arabic_description'],
        englishDescription = json['english_description'],
        numberOfMonths = json['number_of_months'],
        price = json['price'],
        period = json['period'],
        tax = json['tax'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['description'] = this.description;
  //   data['price'] = this.price;
  //   data['period'] = this.period;
  //   data['tax'] = this.tax;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}
