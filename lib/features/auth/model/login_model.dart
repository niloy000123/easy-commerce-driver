class LoginModel {
  Customer? customer;
  Auth? auth;

  LoginModel({this.customer, this.auth});

  LoginModel.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    auth = json['auth'] != null ? Auth.fromJson(json['auth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (auth != null) {
      data['auth'] = auth!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  bool? isVerified;
  String? profilePicture;
  Customer({this.id, this.fullName, this.email, this.phone, this.isVerified});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    isVerified = json['is_verified'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['is_verified'] = isVerified;
    data['profile_picture'] = profilePicture;
    return data;
  }
}

class Auth {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;
  String? issuedAt;

  Auth({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.issuedAt,
  });

  Auth.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    issuedAt = json['issued_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['issued_at'] = issuedAt;
    return data;
  }
}
