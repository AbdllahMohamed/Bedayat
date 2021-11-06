class FoodPackage {
  final int id;
  final String arabicTitle;
  final String englishTitle;
  final String price;
  final bool breakfastAvailability;
  final bool lunchAvailability;
  final bool drinkAvailability;
  final bool snackAvailability;
  FoodPackage({
    required this.id,
    required this.arabicTitle,
    required this.englishTitle,
    required this.price,
    required this.breakfastAvailability,
    required this.lunchAvailability,
    required this.drinkAvailability,
    required this.snackAvailability,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'arabicTitle': arabicTitle,
      'englishTitle': englishTitle,
      'price': price,
      'breakfastAvailability': breakfastAvailability,
      'lunchAvailability': lunchAvailability,
      'drinkAvailability': drinkAvailability,
      'snackAvailability': snackAvailability,
    };
  }

  factory FoodPackage.fromMap(Map<String, dynamic> map) {
    return FoodPackage(
      id: map['id'],
      arabicTitle: map['arabic_title'],
      englishTitle: map['english_title'],
      price: map['price'],
      breakfastAvailability: map['breakfast_availability'],
      lunchAvailability: map['lunch_availability'],
      drinkAvailability: map['drink_availability'],
      snackAvailability: map['snack_availability'],
    );
  }
}
