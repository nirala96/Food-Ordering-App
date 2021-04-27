import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';
import 'package:food_ordering_app/models/DishList.dart';
import 'package:food_ordering_app/services/RestServices.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DashboardLoader extends StatefulWidget {
  @override
  _DashboardLoaderState createState() => _DashboardLoaderState();
}

class _DashboardLoaderState extends State<DashboardLoader> {
  int args;
  @override
  void initState() {
    super.initState();
    getDishData();
  }

  void getDishData() async {
    RestServices restServices = new RestServices();
    ApiResponse _apiResponse = await restServices.getDishes();
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
