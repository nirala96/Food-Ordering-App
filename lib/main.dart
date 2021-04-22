import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ordering_app/views/LandingPage.dart';
import 'package:food_ordering_app/views/dishLoadingScreen.dart';
import 'package:food_ordering_app/views/profile_screen.dart';
import 'views/Dashboard.dart';
import 'views/admin_dashboard.dart';
import 'views/login.dart';
import 'views/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Login Demo', routes: {
      '/': (context) => Landing(),
      '/home': (context) => HomePage(),
      '/login': (context) => LoginPage(),
      '/dash': (context) => Dashboard(),
      '/admindash': (context) => AdminDashboard(),
      '/profile' : (context) => ProfileScreen(),
      '/loadingDash' : (context) => LoadingScreen(),
    });
  }
}
