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
  String document;
  int? userId;
  String? profilePic;
  String? createdAt;
  String? updatedAt;
  String? expireDate;

  dynamic reports;
  Attendance? attendance;

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
    required this.document,
    this.userId,
    this.profilePic,
    this.expireDate,
    this.createdAt,
    this.updatedAt,
    this.reports,
    this.attendance,
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
        updatedAt = json['updated_at'],
        reports = json['reports'],
        attendance = json['attendance'] == null
            ? null
            : Attendance.fromJson(json['attendance']);

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
    data['reports'] = reports;
    data['attendance'] = attendance?.toJson();
    return data;
  }
}

class Attendance {
  Attendance({
    required this.id,
    required this.time,
    required this.attendType,
    required this.branchId,
    required this.childId,
    required this.teacherId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final String time;
  late final String attendType;
  late final int branchId;
  late final int childId;
  late final int teacherId;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    attendType = json['attend_type'];
    branchId = json['branch_id'];
    childId = json['child_id'];
    teacherId = json['teacher_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['time'] = time;
    _data['attend_type'] = attendType;
    _data['branch_id'] = branchId;
    _data['child_id'] = childId;
    _data['teacher_id'] = teacherId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}
