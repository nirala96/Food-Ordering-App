import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';
import 'package:food_ordering_app/models/DishList.dart';
import 'package:food_ordering_app/services/dish_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int args;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDishData();
  }

  void getDishData() async {
    ApiResponse _apiResponse = await getDishes();
    print(_apiResponse.ApiError);
    DishList dishList;
    if ((_apiResponse.ApiError as ApiError) == null) {
      dishList = (_apiResponse.Data as DishList);
    }
    if (args == 1) {
      Navigator.pushNamed(
        context,
        '/admindash',
        arguments: dishList,
      );
    } else {
      Navigator.pushNamed(
        context,
        '/dash',
        arguments: dishList,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
