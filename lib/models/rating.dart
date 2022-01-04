class Rating {
  Rating({
    required this.id,
    required this.teacherId,
    required this.userId,
    required this.rate,
    required this.user,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int teacherId;
  late final int userId;
  late final String rate;
  late final User user;
  late final String comment;
  late final String createdAt;
  late final String updatedAt;

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    userId = json['user_id'];
    rate = json['rate'];
    user = User.fromJson(json['user']);
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['teacher_id'] = teacherId;
    _data['user_id'] = userId;
    _data['rate'] = rate;
    _data['user'] = user.toJson();
    _data['comment'] = comment;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String emailVerifiedAt;
  late final Null currentTeamId;
  late final Null profilePhotoPath;
  late final String phoneNumber;
  late final String createdAt;
  late final String updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    currentTeamId = null;
    profilePhotoPath = null;
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['current_team_id'] = currentTeamId;
    _data['profile_photo_path'] = profilePhotoPath;
    _data['phone_number'] = phoneNumber;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
