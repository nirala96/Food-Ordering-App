import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ordering_app/views/Dashboard.dart';
import 'package:food_ordering_app/views/Forms/DishAddForm.dart';
import 'package:food_ordering_app/views/admin_dashboard.dart';
import 'package:food_ordering_app/views/login.dart';
import 'views/LandingPage.dart';
import 'views/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Login Demo', routes: {
      '/': (context) => DishAddForm(),
      '/login': (context) => LoginPage(),
      '/dash': (context) => Dashboard(),
      '/admindash': (context) => AdminDashboard(),
    });
  }
}
