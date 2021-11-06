class FoodPackageDetails {
  final int id;
  final String arabicTitle;
  final String englishTitle;
  final String arabicDescription;
  final String englishDescription;
  final String mealType;
  final String image;
  final String weekNumber;
  final String dayWeekNumber;
  final int foodPacakgeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  FoodPackageDetails({
    required this.id,
    required this.arabicTitle,
    required this.englishTitle,
    required this.arabicDescription,
    required this.englishDescription,
    required this.mealType,
    required this.image,
    required this.weekNumber,
    required this.dayWeekNumber,
    required this.foodPacakgeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FoodPackageDetails.fromJson(Map<String, dynamic> json) =>
      FoodPackageDetails(
        id: json["id"],
        arabicTitle: json["arabic_title"],
        englishTitle: json["english_title"],
        arabicDescription: json["arabic_description"],
        englishDescription: json["english_description"],
        mealType: json["meal_type"],
        image: json["image"] == null ? null : json["image"],
        weekNumber: json["week_number"],
        dayWeekNumber: json["day_week_number"],
        foodPacakgeId: json["food_pacakge_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "arabic_title": arabicTitle,
        "english_title": englishTitle,
        "arabic_description": arabicDescription,
        "english_description": englishDescription,
        "meal_type": mealType,
        "image": image == null ? null : image,
        "week_number": weekNumber,
        "day_week_number": dayWeekNumber,
        "food_pacakge_id": foodPacakgeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
