class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? currentTeamId;
  String? profilePhotoPath;
  String? phoneNumber;
  String? updatedAt;
  String? createdAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    this.phoneNumber,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'] ?? 'null';
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    phoneNumber = json['phone_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
