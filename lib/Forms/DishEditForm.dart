import 'package:flutter/material.dart';
import 'package:food_ordering_app/animation/FadeAnimation.dart';
import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';
import 'package:food_ordering_app/models/Dish.dart';
import 'package:food_ordering_app/services/RestServices.dart';
import 'package:food_ordering_app/services/UserServices.dart';
import 'package:food_ordering_app/widgets/msgToast.dart';

class DishEditForm extends StatefulWidget {
  @override
  _DishEditFormState createState() => _DishEditFormState();
}

class _DishEditFormState extends State<DishEditForm> {
  TextEditingController DishName = new TextEditingController();
  TextEditingController DishPrice = new TextEditingController();
  TextEditingController RestaurantId = new TextEditingController();

  int IsAvailable;
  String colorGroupValue = '';
  String valueChoose;
  List listItem = ['starter', 'main course', 'dessert', 'snack', 'beverage'];

  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff409439),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text("             EDIT DISH"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: TextField(
                controller: DishName,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Dish name",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            Card(
              child: TextField(
                controller: DishPrice,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Dish Price",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 40.0,
                ),
                Text("Available "),
                Radio(
                    value: 'Available',
                    groupValue: colorGroupValue,
                    onChanged: (val) {
                      colorGroupValue = val;
                      IsAvailable = 1;
                      setState(() {});
                    }),
                SizedBox(
                  width: 50.0,
                ),
                Text("Not Available"),
                Radio(
                    value: 'Not Available',
                    groupValue: colorGroupValue,
                    onChanged: (val) {
                      colorGroupValue = val;
                      IsAvailable = 0;
                      setState(() {});
                    }),
              ],
            ),
            Card(
              child: DropdownButton(
                hint: Text("Select Dish Type"),
                dropdownColor: Colors.white,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(color: Colors.black, fontSize: 15),
                value: valueChoose,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue;
                  });
                },
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            SizedBox(
              height: 75.0,
            ),
            Card(
              child: TextField(
                controller: RestaurantId,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Restaurant ID",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            Card(
              color: Colors.redAccent,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: ListTile(
                onTap: () {
                  showAlertDialog(context);
                },
                title: Center(
                  child: Text(
                    'DELETE',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SourceSansPro',
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          handleDishEdit(context, args);
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void handleDishEdit(BuildContext context, int args) async {
    RestServices restServices = new RestServices();
    ApiResponse _apiResponse = await restServices.editDish(
      DishName.text,
      DishPrice.text,
      IsAvailable.toString(),
      valueChoose,
      args.toString(),
      RestaurantId.text,
    );

    print(_apiResponse.ApiError);
    if ((_apiResponse.ApiError as ApiError) == null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/loadDash',
        ModalRoute.withName('/loadDash'),
        arguments: 1,
      );
    } else {
      msgToast("DishAdd Failed!");
    }
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = Row(
    children: [
      TextButton(
        child: Text("Yes"),
        onPressed: () {},
      ),
      TextButton(
        child: Text("No"),
        onPressed: () {},
      )
    ],
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete"),
    content: Text("Are you sure you want to Delete?"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
