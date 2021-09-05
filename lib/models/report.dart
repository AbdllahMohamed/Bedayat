/*
 "id": 1,
    "mood_status": "high",
    "food_status": "high",
    "drink_status": "high",
    "sleep_status": "high",
    "sleep_dration": 30,
    "temperature_degree": "36",
    "enjoy_with_morning_activity": true,
    "love_sharing_with_friends": true,
    "say_welcome": true,
    "enjoy_with_halqa": true,
    "say_wehda": true,
    "listening_to_quran": true,
    "repeat_ayat": false,
    "new_letter": false,
    "know_the_letter": false,
    "know_the_letter_sound": false,
    "mastered_write_letter": false,
    "enjoy_with_arkan": true,
    "orgnize_after_play": true,
    "mastered_the_activity": true,
    "enjoy_with_art_activity": true,
    "help_himself_in_art_activity": true,
    "enjoy_with_the_story": true,
    "child_id": 2,
    "created_at": "2021-09-04T19:02:29.000000Z",
    "updated_at": "2021-09-04T19:02:29.000000Z"

 */

import 'dart:core';

class Report {
  int? id;
  String? moodSatus; //mood_status": "high",
  String? foodStatus; //food_status": "high",
  String? drinkStatus; //drink_status": "high",
  String? sleepStatus; //sleep_status": "high",
  int? sleepdration; //"sleep_dration": 30,
  String? tempratureDegree; //"temperature_degree": "36",
  bool? enjoyWithMorningActivity; //"enjoy_with_morning_activity": true,
  bool? loveSharingWithFriends; //"love_sharing_with_friends": true,
  bool? sayWelcome; //"say_welcome": true,
  bool? enjoyWithhalqa; //"enjoy_with_halqa": true,
  bool? sayWehda; //"say_wehda": true,
  bool? listeningToQuran; //"listening_to_quran": true,
  bool? reapeatAyat; //"repeat_ayat": false,
  bool? newLetter; //"new_letter": false,
  bool? knowTheLetter; //"know_the_letter": false,
  bool? knowtheLetterSound; //"know_the_letter_sound": false,
  bool? masteredWriteLetter; //"mastered_write_letter": false,
  bool? enjoyWitharkan; //"enjoy_with_arkan": true,
  bool? organizeAfterPlay; //"orgnize_after_play": true,
  bool? masteredTheActivity; //"mastered_the_activity": true,
  bool? enjoyWithArtActivity; //"enjoy_with_art_activity": true,
  bool? helpHimeselfInArtActivity; //"help_himself_in_art_activity": true,
  bool? enjoyWithTheStory; //"enjoy_with_the_story": true,
  int? childId; //"child_id": 2,
  String? createdAt; //"created_at": "2021-09-04T19:02:29.000000Z",
  String? updatedAt; //"updated_at": "2021-09-04T19:02:29.000000Z"

  Report({
    this.id,
    this.moodSatus, //mood_status": "high",
    this.foodStatus, //food_status": "high",
    this.drinkStatus, //drink_status": "high",
    this.sleepStatus, //sleep_status": "high",
    this.sleepdration, //"sleep_dration": 30,
    this.tempratureDegree, //"temperature_degree": "36",
    this.enjoyWithMorningActivity, //"enjoy_with_morning_activity": true,
    this.loveSharingWithFriends, //"love_sharing_with_friends": true,
    this.sayWelcome, //"say_welcome": true,
    this.enjoyWithhalqa, //"enjoy_with_halqa": true,
    this.sayWehda, //"say_wehda": true,
    this.listeningToQuran, //"listening_to_quran": true,
    this.reapeatAyat, //"repeat_ayat": false,
    this.newLetter, //"new_letter": false,
    this.knowTheLetter, //"know_the_letter": false,
    this.knowtheLetterSound, //"know_the_letter_sound": false,
    this.masteredWriteLetter, //"mastered_write_letter": false,
    this.enjoyWitharkan, //"enjoy_with_arkan": true,
    this.organizeAfterPlay, //"orgnize_after_play": true,
    this.masteredTheActivity, //"mastered_the_activity": true,
    this.enjoyWithArtActivity, //"enjoy_with_art_activity": true,
    this.helpHimeselfInArtActivity, //"help_himself_in_art_activity": true,
    this.enjoyWithTheStory, //"enjoy_with_the_story": true,
    this.childId, //"child_id
    this.createdAt,
    this.updatedAt,
  });

  Report.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        moodSatus = json['mood_status'],
        foodStatus = json['food_status'],
        drinkStatus = json['drink_status'],
        sleepStatus = json['sleep_status'],
        sleepdration = json['sleep_dration'],
        tempratureDegree = json['temperature_degree'],
        enjoyWithMorningActivity = json['enjoy_with_morning_activity'],
        loveSharingWithFriends = json['love_sharing_with_friends'],
        sayWelcome = json['say_welcome'],
        enjoyWithhalqa = json['enjoy_with_halqa'],
        sayWehda = json['say_wehda'],
        listeningToQuran = json['listening_to_quran'],
        reapeatAyat = json['repeat_ayat'],
        newLetter = json['new_letter'],
        knowTheLetter = json['know_the_letter'],
        knowtheLetterSound = json['know_the_letter_sound'],
        masteredWriteLetter = json['mastered_write_letter'],
        enjoyWitharkan = json['enjoy_with_arkan'],
        organizeAfterPlay = json['orgnize_after_play'],
        masteredTheActivity = json['mastered_the_activity'],
        enjoyWithArtActivity = json['enjoy_with_art_activity'],
        helpHimeselfInArtActivity = json['help_himself_in_art_activity'],
        enjoyWithTheStory = json['enjoy_with_the_story'],
        childId = json['child_id'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = id;
    data['mood_status'] = moodSatus;
    data['food_status'] = foodStatus;
    data['drink_status'] = drinkStatus;
    data['sleep_status'] = sleepStatus;
    data['sleep_dration'] = sleepdration;
    data['temperature_degree'] = tempratureDegree;
    data['enjoy_with_morning_activity'] = enjoyWithMorningActivity;
    data['love_sharing_with_friends'] = loveSharingWithFriends;
    data['say_welcome'] = sayWelcome;
    data['enjoy_with_halqa'] = enjoyWithhalqa;
    data['say_wehda'] = sayWehda;
    data['listening_to_quran'] = listeningToQuran;
    data['repeat_ayat'] = reapeatAyat;
    data['new_letter'] = newLetter;
    data['know_the_letter'] = knowTheLetter;
    data['know_the_letter_sound'] = knowtheLetterSound;
    data['mastered_write_letter'] = masteredWriteLetter;
    data['enjoy_with_arkan'] = enjoyWitharkan;
    data['orgnize_after_play'] = organizeAfterPlay;
    data['mastered_the_activity'] = masteredTheActivity;
    data['enjoy_with_art_activity'] = enjoyWithArtActivity;
    data['help_himself_in_art_activity'] = helpHimeselfInArtActivity;
    data['enjoy_with_the_story'] = enjoyWithTheStory;
    data['child_id'] = childId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
