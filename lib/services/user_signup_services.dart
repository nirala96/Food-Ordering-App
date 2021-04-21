import 'dart:convert';
import 'dart:io';

import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';
import 'package:food_ordering_app/models/user_model.dart';
import 'package:food_ordering_app/views/widgets/msgToast.dart';
import 'package:http/http.dart' as http;


Future<ApiResponse> signupUser(
    String userId, String username, String userPass) async {
  int isAdmin = 0;
  ApiResponse _apiResponse = new ApiResponse();
  print("reached signup user");
  Uri url = Uri.parse('http://192.168.43.27:8800/login/newuser');
  try {
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

    switch (response.statusCode) {
      case 200:
        _apiResponse.Data = User.fromJson(json.decode(response.body));
        showToastMsg('SignUp Succesful');
        break;
      case 409:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        // showToastMsg('login failed');
        break;
      default:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        // showToastMsg('login failed');
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return _apiResponse;
}
