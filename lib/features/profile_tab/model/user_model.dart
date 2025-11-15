class UserModel {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  bool? isVerified;
  String? profilePicture;
  String? createdAt;
  int? profileCompletionPercentage;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.isVerified,
    this.profilePicture,
    this.createdAt,
    this.profileCompletionPercentage,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    isVerified = json['is_verified'];
    profilePicture = json['profile_picture'];
    createdAt = json['created_at'];
    profileCompletionPercentage = json['profile_completion_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['is_verified'] = isVerified;
    data['profile_picture'] = profilePicture;
    data['created_at'] = createdAt;
    data['profile_completion_percentage'] = profileCompletionPercentage;
    return data;
  }
}
