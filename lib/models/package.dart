class Package {
  int? id;
  String? title;
  String? description;
  String? price;
  String? period;
  String? tax;

  String? createdAt;
  String? updatedAt;

  Package({
    this.id,
    this.title,
    this.description,
    this.price,
    this.period,
    this.tax,
    this.createdAt,
    this.updatedAt,
  });

  Package.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        price = json['price'],
        period = json['period'],
        tax = json['tax'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['period'] = this.period;
    data['tax'] = this.tax;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
