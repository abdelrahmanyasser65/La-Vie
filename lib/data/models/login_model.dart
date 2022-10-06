class LoginModel {
  LoginModel({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final Data data;

  LoginModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

}

class Data {
  Data({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });
  late final User user;
  late final String accessToken;
  late final String refreshToken;

  Data.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

}

class User {
  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
    this.address,
    required this.role,
  });
  late final String userId;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String imageUrl;
  late final Null address;
  late final String role;

  User.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = null;
    role = json['role'];
  }

}