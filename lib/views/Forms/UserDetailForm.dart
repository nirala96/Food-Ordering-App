import 'package:flutter/material.dart';

class UserDetailForm extends StatefulWidget {
  @override
  _UserDetailFormState createState() => _UserDetailFormState();
}

class _UserDetailFormState extends State<UserDetailForm> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff409439),
          leading: IconButton(icon: Icon(Icons.menu), onPressed: (){

          }),
          title: Text("             EDIT DETAILS"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){


            })
          ],
        ),
        body: SingleChildScrollView(

          child: Column(
            children: <Widget>[
              Card(

                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEEEEEE),
                    labelText: "User ID*",
                  ),
                  onChanged: (value) {

                  },

                ),

                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),

              ),
              Align(

                alignment: Alignment.topLeft,
                child:  Padding(
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
                  style: TextStyle(
                    color: Colors.black,
                  ),

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEEEEEE),
                    labelText: "Email",
                  ),
                  onChanged: (value) {

                  },

                ),

                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),

              ),

              Card(


                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEEEEEE),
                    labelText: "Phone",
                  ),
                  onChanged: (value) {

                  },

                ),


                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),

              ),


            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
            child: Icon(Icons.save),
    ),
    );
  }
}
