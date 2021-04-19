import 'dart:convert';

import 'package:food_ordering_app/models/user_api_model.dart';
import 'package:food_ordering_app/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<UserApi> signupUser(
    String userId, String username, String userPass) async {
  int isAdmin = 0;
  Uri url = Uri.parse('http://192.168.43.27:8800/loginnewuser');
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user_id': userId,
      'user_name': username,
      'user_pass': userPass,
      'isAdmin': isAdmin.toString()
    }),
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonString = json.decode(response.body);

    return UserApi.fromJson(jsonString);
  }
}
