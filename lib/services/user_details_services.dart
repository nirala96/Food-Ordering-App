import 'dart:convert';
import 'dart:io';
import 'package:food_ordering_app/models/UserDetails.dart';
import 'package:http/http.dart' as http;
import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';

Future<ApiResponse> getUserDetails(String userId) async {
  ApiResponse _apiResponse = new ApiResponse();
  Uri url = Uri.parse('http://192.168.43.27:8800/userdetails');
  try {
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_id': userId,
      }),
    );

     switch (response.statusCode) {
      case 200:
        _apiResponse.Data = UserDetails.fromJson(json.decode(response.body));
        break;
      case 401:
        print((_apiResponse.ApiError as ApiError).error);
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        print((_apiResponse.ApiError as ApiError).error);
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return _apiResponse;
}
