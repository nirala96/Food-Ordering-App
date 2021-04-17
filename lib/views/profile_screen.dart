
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff212121),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/prakhar.jpg'),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
//                  child: Divider(
//                    color: Colors.white,
//                  ),
                ),
                Text(
                  'Pramkhar',
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
                  'Gulabi@gmail.com',
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
                    )),
                Card(
                  color: Color(0xff373737),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
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