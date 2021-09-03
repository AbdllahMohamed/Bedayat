class Group {
  int? id;
  String? title;
  int? branchId;

  String? createdAt;
  String? updatedAt;

  Group({
    this.id,
    this.title,
    this.branchId,
    this.createdAt,
    this.updatedAt,
  });

  Group.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        branchId = json['branch_id'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['branch_id'] = this.branchId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
