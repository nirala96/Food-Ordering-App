import 'package:food_ordering_app/models/user_model.dart';

class UserApi {
  bool status;
  User user;

  UserApi({this.status, this.user});

  factory UserApi.fromJson(Map<String, dynamic> parsedJson) {
    return UserApi(
      status: parsedJson['status'],
      user: User.fromJson(
        parsedJson['user'],
      ),
    );
  }
}
