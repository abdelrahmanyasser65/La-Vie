class UserModel {
  UserModel({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final Data data;

  UserModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }


}

class Data {
  Data({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
    required this.address,
    required this.userPoints,
    required this.userNotification,
  });
  late final String userId;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String imageUrl;
  late  var address;
  late  var userPoints;
  late final List<String> userNotification;

  Data.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    userPoints = json['UserPoints'];
    userNotification = List.castFrom<dynamic, String>(json['UserNotification']);
  }

}