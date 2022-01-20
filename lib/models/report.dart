import 'activity.dart';
import 'attachment.dart';

class Report {
  Report({
    required this.id,
    required this.moodStatusMorning,
    required this.moodStatusNoon,
    required this.moodStatusAfternoon,
    required this.foodStatusBreakfast,
    required this.foodStatusLunch,
    required this.foodStatusSnak,
    required this.drinkStatus,
    required this.sleepStatus,
    required this.sleepDration,
    required this.temperatureDegree,
    required this.poeNumbers,
    required this.pieNumbers,
    required this.createdAt,
    required this.notes,
    required this.attachments,
    required this.activities,
  });
  late final int id;
  late final String moodStatusMorning;
  late final String moodStatusNoon;
  late final String moodStatusAfternoon;
  late final String foodStatusBreakfast;
  late final String foodStatusLunch;
  late final String foodStatusSnak;
  late final String drinkStatus;
  late final String sleepStatus;
  late final int sleepDration;
  late final String temperatureDegree;
  late final int poeNumbers;
  late final int pieNumbers;
  late final String createdAt;
  late final String? notes;
  late final List<Attachments> attachments;
  late final List<Activity> activities;

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moodStatusMorning = json['mood_status_morning'];
    moodStatusNoon = json['mood_status_noon'];
    moodStatusAfternoon = json['mood_status_afternoon'];
    foodStatusBreakfast = json['food_status_breakfast'];
    foodStatusLunch = json['food_status_lunch'];
    foodStatusSnak = json['food_status_snak'];
    drinkStatus = json['drink_status'];
    sleepStatus = json['sleep_status'];
    sleepDration = json['sleep_dration'];
    temperatureDegree = json['temperature_degree'];
    poeNumbers = json['poe_numbers'];
    pieNumbers = json['pie_numbers'];
    createdAt = json['created_at'];
    notes = json['notes'];
    attachments = List.from(json['attachments'])
        .map((e) => Attachments.fromJson(e))
        .toList();
    activities =
        List.from(json['activities']).map((e) => Activity.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['mood_status_morning'] = moodStatusMorning;
    _data['mood_status_noon'] = moodStatusNoon;
    _data['mood_status_afternoon'] = moodStatusAfternoon;
    _data['food_status_breakfast'] = foodStatusBreakfast;
    _data['food_status_lunch'] = foodStatusLunch;
    _data['food_status_snak'] = foodStatusSnak;
    _data['drink_status'] = drinkStatus;
    _data['sleep_status'] = sleepStatus;
    _data['sleep_dration'] = sleepDration;
    _data['temperature_degree'] = temperatureDegree;
    _data['poe_numbers'] = poeNumbers;
    _data['pie_numbers'] = pieNumbers;
    _data['created_at'] = createdAt;
    _data['notes'] = notes;
    _data['attachments'] = attachments.map((e) => e.toJson()).toList();
    _data['activities'] = activities.map((e) => e.toJson()).toList();
    return _data;
  }
}
