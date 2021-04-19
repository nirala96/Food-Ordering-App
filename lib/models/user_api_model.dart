import 'package:food_ordering_app/models/dish_model.dart';

class UserApi{
  String status;
  User user;

  UserApi({
    this.status,
    this.user
  });

  factory UserApi.fromJson(Map<String, dynamic> parsedJson){
  return UserApi(
    status: parsedJson['status'],
    user: User.fromJson(parsedJson['user'])
  );
}
}