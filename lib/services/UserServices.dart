import 'dart:convert';
import 'dart:io';
import 'package:food_ordering_app/models/User.dart';
import 'package:food_ordering_app/models/UserDetails.dart';
import 'package:food_ordering_app/widgets/msgToast.dart';
import 'package:http/http.dart' as http;
import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';

class UserServices {
  Future<ApiResponse> details(String userId) async {
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

  Future<ApiResponse> login(String userName, String userPass) async {
    ApiResponse _apiResponse = new ApiResponse();
    print("reached login user");
    Uri url = Uri.parse('http://192.168.43.27:8800/login');

    try {
      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_id': userName,
          'user_pass': userPass,
        }),
      );

      switch (response.statusCode) {
        case 200:
          _apiResponse.Data = User.fromJson(json.decode(response.body));
          msgToast('login Succesful');
          break;
        case 401:
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

  Future<ApiResponse> signup(
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
          msgToast('SignUp Succesful');
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

  Future<ApiResponse> dish_add_form(String dish_id, String dish_name, String dish_price, String isAvailable, String restaurant_id, String dish_type) async {
//    int isAvailable= 0;
    ApiResponse _apiResponse = new ApiResponse();
    print("reached dish add user");
    ///////////isko dekho kon sa api hai
    Uri url = Uri.parse('http://192.168.43.27:8800/login/newuser');
    try {
      final http.Response response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'dish_id': dish_id,
          'dish_name': dish_name,
          'dish_price': dish_price,
          'isAvailable': isAvailable,
          'dish_rest_id': restaurant_id,
          'dish_type': dish_type
        }),
      );

      switch (response.statusCode) {
        case 200:
          _apiResponse.Data = User.fromJson(json.decode(response.body));
          msgToast('Dish Add Succesful');
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


  Future<ApiResponse> dish_edit_form(String dish_name, String dish_price, String isAvailable, String dish_type) async {
//    int isAvailable= 0;
    ApiResponse _apiResponse = new ApiResponse();
    print("reached edit dish user");
    ///////////isko dekho kon sa api hai
    Uri url = Uri.parse('http://192.168.43.27:8800/login/newuser');
    try {
      final http.Response response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'dish_name': dish_name,
          'dish_price': dish_price,
          'isAvailable': isAvailable,
          'dish_type': dish_type
        }),
      );

      switch (response.statusCode) {
        case 200:
          _apiResponse.Data = User.fromJson(json.decode(response.body));
          msgToast('Dish Edit Succesful');
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


  Future<ApiResponse> user_detail_form(String user_id, String email, String phone, String address, String pincode) async {
//    int isAvailable= 0;
    ApiResponse _apiResponse = new ApiResponse();
    print("reached edit dish user");
    ///////////isko dekho kon sa api hai
    Uri url = Uri.parse('http://192.168.43.27:8800/login/newuser');
    try {
      final http.Response response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_id': user_id,
          'user_email': email,
          'user_phno': phone,
          'user_addline': address,
          'user_pincode': pincode
        }),
      );

      switch (response.statusCode) {
        case 200:
          _apiResponse.Data = User.fromJson(json.decode(response.body));
          msgToast('Dish Edit Succesful');
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

}
