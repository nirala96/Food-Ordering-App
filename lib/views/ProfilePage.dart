import 'package:flutter/material.dart';
import 'package:food_ordering_app/Forms/UserDetailForm.dart';
import 'package:food_ordering_app/models/UserDetails.dart';
import 'package:food_ordering_app/views/User/OrderHistory.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDetails args =
        ModalRoute.of(context).settings.arguments as UserDetails;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff212121),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/nirala.jpeg'),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
//                  child: Divider(
//                    color: Colors.white,
//                  ),
            ),
            Text(
              args.user_name,
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
              width: 150.0,
//                  child: Divider(
//                    color: Colors.white,
//                  ),
            ),
            Text(
              args.user_email,
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.white,
                fontSize: 13.0,
                letterSpacing: 2.5,
                //fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Color(0xff373737),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderHistoryPage()));
                },
                leading: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                title: Text(
                  'Your orders',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 17.0,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Card(
              color: Color(0xff373737),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserDetailForm()));
                },
                leading: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                title: Text(
                  'Edit',
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                      fontFamily: 'Source Sans Pro'),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Card(
              color: Color(0xff373737),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                onTap: () {
                  showAlertDialog(context);
                },
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 17.0,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = Row(
    children: [
      TextButton(
        child: Text("Yes"),
        onPressed: () {
          _logoutHandler(context);
        },
      ),
      TextButton(
        child: Text("No"),
        onPressed: () => Navigator.pop(context),
      )
    ],
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout"),
    content: Text("Are you sure you want to Logout?"),
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

void _logoutHandler(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('user_id');
  Navigator.pushNamedAndRemoveUntil(
      context, '/home', ModalRoute.withName('/home'));
}
