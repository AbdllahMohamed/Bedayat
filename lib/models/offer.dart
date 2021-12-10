class Offer {
  Offer({
    required this.id,
    required this.isActive,
    required this.arabicTitle,
    required this.englishTitle,
    required this.arabicDescription,
    required this.englishDescription,
    required this.promoCode,
    required this.image,
    required this.discountRatio,
    required this.additionalDays,
    required this.maxNumberOfRedeems,
    required this.startAt,
    required this.endAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final bool isActive;
  late final String arabicTitle;
  late final String englishTitle;
  late final String arabicDescription;
  late final String englishDescription;
  late final String promoCode;
  late final String image;
  late final String discountRatio;
  late final int additionalDays;
  late final int maxNumberOfRedeems;
  late final String startAt;
  late final String endAt;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
    arabicTitle = json['arabic_title'];
    englishTitle = json['english_title'];
    arabicDescription = json['arabic_description'];
    englishDescription = json['english_description'];
    promoCode = json['promo_code'];
    image = json['image'];
    discountRatio = json['discount_ratio'];
    additionalDays = json['additional_days'];
    maxNumberOfRedeems = json['max_number_of_redeems'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['is_active'] = isActive;
    _data['arabic_title'] = arabicTitle;
    _data['english_title'] = englishTitle;
    _data['arabic_description'] = arabicDescription;
    _data['english_description'] = englishDescription;
    _data['promo_code'] = promoCode;
    _data['image'] = image;
    _data['discount_ratio'] = discountRatio;
    _data['additional_days'] = additionalDays;
    _data['max_number_of_redeems'] = maxNumberOfRedeems;
    _data['start_at'] = startAt;
    _data['end_at'] = endAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}
