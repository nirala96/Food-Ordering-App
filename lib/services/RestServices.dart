import 'dart:convert';
import 'dart:io';

import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';
import 'package:food_ordering_app/models/DishList.dart';
import 'package:food_ordering_app/widgets/msgToast.dart';
import 'package:http/http.dart' as http;

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
