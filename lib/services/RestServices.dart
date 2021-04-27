import 'dart:convert';
import 'dart:io';

import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';
import 'package:food_ordering_app/models/Dish.dart';
import 'package:food_ordering_app/models/DishList.dart';
import 'package:food_ordering_app/widgets/msgToast.dart';
import 'package:http/http.dart' as http;

class RestServices {
  Future<ApiResponse> getDishes() async {
    ApiResponse _apiResponse = new ApiResponse();
    Uri url = Uri.parse('http://192.168.43.27:8800/dishes');
    try {
      final http.Response response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          _apiResponse.Data = DishList.fromJson(json.decode(response.body));
          break;
        case 401:
          _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          msgToast('Server error. Please retry');
          break;
        default:
          _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          msgToast('Server error. Please retry');
          break;
      }
    } on SocketException {
      _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
    }
    return _apiResponse;
  }
  Future<ApiResponse> addDish(String dish_name, int dish_price,
      String dish_type, String restaurant_id) async {
    int isAvailable = 1;
    ApiResponse _apiResponse = new ApiResponse();
    Uri url = Uri.parse('http://192.168.43.27:8800/dishes');
    try {
      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          //'dish_id': dish_id,
          'dish_name': dish_name,
          'dish_price': dish_price.toString(),
          'isAvailable': isAvailable.toString(),
          'dish_type': dish_type,
          'dish_rest_id': restaurant_id
        }),
      );

      switch (response.statusCode) {
        case 200:
          _apiResponse.Data = Dish.fromJson(json.decode(response.body));
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

  Future<ApiResponse> editDish(String dish_name, String dish_price,
      String isAvailable, String dish_type, String dish_id, String dish_rest_id) async {
//    int isAvailable= 0;
    ApiResponse _apiResponse = new ApiResponse();
    ///////////isko dekho kon sa api hai
    Uri url = Uri.parse('http://192.168.43.27:8800/dishes/$dish_id');
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
          'dish_type': dish_type,
          'dish_rest_id': dish_rest_id,
        }),
      );

      switch (response.statusCode) {
        case 200:
          // _apiResponse.Data = Dish.fromJson(json.decode(response.body));
          msgToast('Dish Edit Succesful');
          break;
        case 409:
          _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          //msgToast('login failed');
          break;
        default:
          _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          // msgToast('login failed');
          break;
      }
    } on SocketException {
      _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
    }
    return _apiResponse;
  }
}
