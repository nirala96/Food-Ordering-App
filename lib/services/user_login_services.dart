import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_ordering_app/models/user_api_model.dart';
import 'package:food_ordering_app/models/user_model.dart';
import 'package:food_ordering_app/views/Dashboard.dart';
import 'package:food_ordering_app/views/admin_dashboard.dart';
import 'package:food_ordering_app/views/login.dart';
import 'package:http/http.dart' as http;

Future<UserApi> LoginUser(
    String userName, String userPass, BuildContext context) async {
  Uri url = Uri.parse('http://192.168.43.27:8800/login');
  final http.Response res = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user_id': userName,
      'user_pass': userPass,
    }),
  );
  var data = json.decode(res.body);
  UserApi temp = new UserApi.fromJson(data);
  User CurrentUser = temp.user;
  if (res.statusCode == 403) {
    print('login failed');
    Fluttertoast.showToast(
      msg: "Login Failed",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  } else {
    Fluttertoast.showToast(
      msg: "Login Succesful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    if (CurrentUser.isAdmin == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdminDashboard(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ),
      );
    }
  }
}
