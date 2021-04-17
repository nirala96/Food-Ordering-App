import 'dart:convert';

import 'package:food_ordering_app/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<User> signupUser(String userName, String userPass) async {
  Uri url = Uri.parse('http://192.168.43.27:8800/SignUpUser');
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user_name': userName,
      'user_pass': userPass,
      'isAdmin': 'false'
    }),
  );
  if (response.statusCode == 201) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
