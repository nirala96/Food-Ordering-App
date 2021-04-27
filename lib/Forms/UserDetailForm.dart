import 'package:flutter/material.dart';
import 'package:food_ordering_app/animation/FadeAnimation.dart';
import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';
import 'package:food_ordering_app/services/UserServices.dart';
import 'package:food_ordering_app/widgets/msgToast.dart';

class UserDetailForm extends StatefulWidget {
  @override
  _UserDetailFormState createState() => _UserDetailFormState();
}

class _UserDetailFormState extends State<UserDetailForm> {
  TextEditingController UserID = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Phone = new TextEditingController();
  TextEditingController Address = new TextEditingController();
  TextEditingController Pincode = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff409439),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text("             EDIT DETAILS"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: TextField(
                controller: UserID,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "User ID*",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(
                  "generated automatically",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),

            Card(
              child: TextField(
                controller: Email,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Email",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),

            Card(
              child: TextField(
                controller: Phone,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Phone",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),

            Card(
              child: TextField(
                controller: Address,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Address",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
            Card(
              child: TextField(
                controller: Pincode,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  labelText: "Pincode",
                ),
                onChanged: (value) {},
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
            ),
//              SizedBox(
//                  height: 20.0,
//              ),
            FadeAnimation(
              1.2,
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Form.png'),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          handleDetails(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void handleDetails(BuildContext context) async {
    UserServices userServices = new UserServices();
    ApiResponse _apiResponse = await userServices.user_detail_form(
        UserID.text, Email.text, Phone.text, Address.text, Pincode.text);

    print(_apiResponse.ApiError);
    if ((_apiResponse.ApiError as ApiError) == null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/admindash',
        ModalRoute.withName('/admindash'),
      );
      Navigator.pushNamed(context, '/profile');
    } else {
      msgToast("DishAdd Failed!");
    }
  }
}
