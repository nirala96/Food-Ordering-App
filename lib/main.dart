import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ordering_app/views/Dashboard.dart';
import 'package:food_ordering_app/views/admin_dashboard.dart';
import 'package:food_ordering_app/views/login.dart';
import 'views/LandingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Login Demo', routes: {
      '/': (context) => HomePage(),
      '/login': (context) => LoginPage(),
      '/dash': (context) => Dashboard(),
      '/admindash': (context) => AdminDashboard(),
    });
  }
}
