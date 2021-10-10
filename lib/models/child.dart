class Child {
  int? id;
  String? firstName;
  String? lastName;
  String? ageGroup;
  String? gender;
  String? emergencyNumber;
  String? notes;
  String? allergy;
  bool? photography;
  String? parentOneRealation;
  String? parentOneEmail;
  String? parentOnePhone;
  String? parentTwoRealation;
  String? parentTwoEmail;
  String? parentTwoPhone;
  String? familyCard;
  String? vaccinationCertificate;
  String? document;
  int? userId;
  String? profilePic;
  String? createdAt;
  String? updatedAt;
  String? expireDate;

  Child({
    this.id,
    this.firstName,
    this.lastName,
    this.ageGroup,
    this.gender,
    this.emergencyNumber,
    this.notes,
    this.allergy,
    this.photography,
    this.parentOneRealation,
    this.parentOneEmail,
    this.parentOnePhone,
    this.parentTwoRealation,
    this.parentTwoEmail,
    this.parentTwoPhone,
    this.familyCard,
    this.vaccinationCertificate,
    this.document,
    this.userId,
    this.profilePic,
    this.expireDate,
    this.createdAt,
    this.updatedAt,
  });

  Child.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['frist_name'],
        lastName = json['last_name'],
        ageGroup = json['age_group'],
        gender = json['gender'],
        emergencyNumber = json['emergency_number'],
        notes = json['notes'],
        allergy = json['allergy'],
        photography = json['photography'],
        parentOneRealation = json['parent_one_realation'],
        parentOneEmail = json['parent_one_email'],
        parentOnePhone = json['parent_one_phone'],
        parentTwoRealation = json['parent_two_realation'],
        parentTwoEmail = json['parent_two_email'],
        parentTwoPhone = json['parent_two_phone'],
        expireDate = json['expire_date'],
        familyCard = json['family_card'],
        vaccinationCertificate = json['vaccination_certificate'],
        document = json['document'],
        userId = json['user_id'],
        profilePic = json['profile_pic'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = id;
    data['frist_name'] = firstName;
    data['age_group'] = ageGroup;
    data['gender'] = gender;
    data['emergency_number'] = emergencyNumber;
    data['notes'] = notes;
    data['allergy'] = allergy;
    data['photography'] = photography;
    data['parent_one_realation'] = parentOneRealation;
    data['parent_one_email'] = parentOneEmail;
    data['parent_one_phone'] = parentOnePhone;
    data['parent_two_realation'] = parentTwoRealation;
    data['parent_two_email'] = parentTwoEmail;
    data['parent_two_phone'] = parentTwoPhone;
    data['family_card'] = familyCard;
    data['vaccination_certificate'] = vaccinationCertificate;
    data['document'] = document;
    data['user_id'] = userId;
    data['profile_pic'] = profilePic;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
