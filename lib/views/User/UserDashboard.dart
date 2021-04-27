import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';
import 'package:food_ordering_app/models/DishList.dart';
import 'package:food_ordering_app/models/UserDetails.dart';
import 'package:food_ordering_app/services/UserServices.dart';
import 'package:food_ordering_app/views/CartPage.dart';
import 'package:food_ordering_app/views/User/UserCatalogItem.dart';
import 'package:food_ordering_app/widgets/msgToast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DishList futDishList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DishList args = ModalRoute.of(context).settings.arguments as DishList;
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.account_circle),
          onPressed: () {
            _ProfileHandler(context);
          },
        ),
        title: new Text("Swiggato - DashBoard"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: CatalogList(dishList: args),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(
             context, MaterialPageRoute(builder: (context) => CartPage()));
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

void _ProfileHandler(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _userId = (prefs.getString("user_id") ?? "");
  if (_userId == "") {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/home',
      ModalRoute.withName('/home'),
    );
    msgToast("invalid Login State!");
  } else {
    UserServices userServices = new UserServices();
    ApiResponse _apiResponse = await userServices.details(_userId);
    if ((_apiResponse.ApiError as ApiError) == null) {
      Navigator.pushNamed(
        context,
        '/profile',
        arguments: (_apiResponse.Data as UserDetails),
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        ModalRoute.withName('/home'),
      );
      msgToast("invalid Login State!");
    }
  }
}

class CatalogList extends StatelessWidget {
  final DishList dishList;

  CatalogList({Key key, this.dishList});
  @override
  Widget build(BuildContext context) {
    return (dishList==null)?"Nothing to show".text.xl3.make().centered():ListView.builder(
      shrinkWrap: true,
      itemCount: dishList.length,
      itemBuilder: (context, index) {
        return CatalogItemUser(dish: dishList.getIndex(index));
      },
    );
  }
}
