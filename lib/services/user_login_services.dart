import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/user_api_model.dart';
import 'package:food_ordering_app/models/user_model.dart';
import 'package:food_ordering_app/views/Dashboard.dart';
import 'package:food_ordering_app/views/admin_dashboard.dart';
import 'package:food_ordering_app/views/login.dart';
import 'package:http/http.dart' as http;

import '../models/ApiRespose.dart';

void showToastMsg(String s) {
  Fluttertoast.showToast(
    msg: s,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Future<ApiResponse> LoginUser(String userName, String userPass) async {
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
        showToastMsg('login Succesful');
        break;
      case 401:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        showToastMsg('login failed');
        break;
      default:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        showToastMsg('login failed');
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return _apiResponse;
  // if (res.statusCode == 403) {
  //   showToastMsg("Login Failed");
  // } else {
  //   showToastMsg("Login Failed");
  // }
}

/* 
 void showToastMsg(String s) {
    Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<ApiResponse> LoginUser(String userName, String password) async {
    ApiResponse _apiResponse = new ApiResponse();

    Uri url = Uri.parse('http://192.168.43.27:8800/login');

    try {
      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_id': userName,
          'user_pass': password,
        }),
      );

      switch (response.statusCode) {
        case 200:
          _apiResponse.Data = User.fromJson(json.decode(response.body));
          showToastMsg('login Succesful');
          break;
        case 401:
          _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          showToastMsg('login failed');
          break;
        default:
          _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
          showToastMsg('login failed');
          break;
      }
    } on SocketException {
      _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
    }
    return _apiResponse;
    */