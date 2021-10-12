class AddChild {
  int? id;
  String? name;
  String? childFirstName; // "age_group": "1",
  String? childSecondName; // "age_group": "1",
  String? ageGroup; // "age_group": "1",
  String? gender;
  String? emergencyNumber; //"emergency_number": "test",
  String? notes; //"notes": "testt",
  String? allergy; //"allergy": "test",
  bool? photography; //"photography": false,
  String? parentOneRealation; //"parent_one_realation": "test",
  String? parentOneEmail; //"parent_one_email": "test",
  String? parentOnePhone; //"parent_one_phone": "test",
  String? parentTwoRealation; //"parent_two_realation": "test",
  String? parentTwoEmail; //"parent_two_email": "test",
  String? parentTwoPhone; //"parent_two_phone": "test",
  String?
      familyCard; //"family_card": "public/966wbAayWRp6I2XGMdV6aZSdamqTQ75wOJc7cCrt.jpg",
  String?
      vaccinationCertificate; //"vaccination_certificate": "public/65NxohcolPgM89QJWWb7mPED3QMpJZE3E4wZ9vT8.jpg",
  String?
      document; //"document": "public/7S3n2pPVh5aKwWGZvhtjlnsAGDscZ1dAywzUgoos.jpg",
  int? userId; //"user_id": 1,
  String?
      profilePic; //"profile_pic": "public/qCMRr3RJJqihH6DeWNQAnrT5fA7hGrQ8DfLShECq.png",
  String? createdAt; //"created_at": "2021-09-04T18:52:00.000000Z",
  String? updatedAt;
  //"updated_at": "2021-09-04T18:52:00.000000Z"
  String? relationOneFirstName; //"updated_at": "2021-09-04T18:52:00.000000Z"
  String? relationOneSecondName; //"updated_at": "2021-09-04T18:52:00.000000Z"
  String? relationOneThirdName; //"updated_at": "2021-09-04T18:52:00.000000Z"
  String? relationTwoFirstName; //"updated_at": "2021-09-04T18:52:00.000000Z"
  String? relationTwoScecondName; //"updated_at": "2021-09-04T18:52:00.000000Z"
  String? relationTwoThirdName; //"updated_at": "2021-09-04T18:52:00.000000Z"
  String? emergencyName; //"updated_at": "2021-09-04T18:52:00.000000Z"
  String? emergencyRelation; //"updated_at": "2021-09-04T18:52:00.000000Z"

  AddChild(
      {this.id,
      this.name,
      this.ageGroup,
      this.gender,
      this.emergencyNumber,
      this.notes,
      this.allergy,
      this.photography,
      this.parentOneRealation, //"parent_one_realation": "test",
      this.parentOneEmail, //"parent_one_email": "test",
      this.parentOnePhone, //"parent_one_phone": "test",
      this.parentTwoRealation, //"parent_two_realation": "test",
      this.parentTwoEmail, //"parent_two_email": "test",
      this.parentTwoPhone, //"parent_two_phone": "test",
      this.familyCard, //"family_card": "public/966wbAayWRp6I2XGMdV6aZSdamqTQ75wOJc7cCrt.jpg",
      this.vaccinationCertificate, //"vaccination_certificate": "public/65NxohcolPgM89QJWWb7mPED3QMpJZE3E4wZ9vT8.jpg",
      this.document, //"document": "public/7S3n2pPVh5aKwWGZvhtjlnsAGDscZ1dAywzUgoos.jpg",
      this.userId, //"user_id": 1,
      this.profilePic, //"profile_pic": "public/qCMRr3RJJqihH6DeWNQAnrT5fA7hGrQ8DfLShECq.png",
      this.createdAt, //"created_at": "2021-09-04T18:52:00.000000Z",
      this.updatedAt,
      this.emergencyName,
      this.emergencyRelation,
      this.relationOneFirstName,
      this.relationOneSecondName,
      this.relationOneThirdName,
      this.relationTwoFirstName,
      this.relationTwoScecondName,
      this.relationTwoThirdName});

  AddChild.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        ageGroup = json['age_group'],
        gender = json['gender'],
        notes = json['notes'],
        childFirstName = json['frist_name'],
        childSecondName = json['last_name'],
        allergy = json['allergy'],
        photography = json['photography'],
        parentOneRealation = json['parent_one_realation'],
        parentOneEmail = json['parent_one_email'],
        parentOnePhone = json['parent_one_phone'],
        parentTwoRealation = json['parent_two_realation'],
        parentTwoEmail = json['parent_two_email'],
        parentTwoPhone = json['parent_two_phone'],
        familyCard = json['family_card'],
        vaccinationCertificate = json['vaccination_certificate'],
        document = json['document'],
        userId = json['user_id'],
        profilePic = json['profile_pic'],
        relationOneFirstName = json['relation_one_first_name'],
        relationOneSecondName = json['relation_one_second_name'],
        relationOneThirdName = json['relation_one_third_name'],
        relationTwoFirstName = json['relation_two_first_name'],
        relationTwoScecondName = json['relation_two_scecond_name'],
        relationTwoThirdName = json['relation_two_third_name'],
        emergencyName = json['emergency_name'],
        emergencyRelation = json['emergency_relation'],
        emergencyNumber = json['emergency_number'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = id;
    data['name'] = name;
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
