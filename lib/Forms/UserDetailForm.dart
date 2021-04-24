import 'package:flutter/material.dart';
import 'package:food_ordering_app/animation/FadeAnimation.dart';

class UserDetailForm extends StatefulWidget {
  @override
  _UserDetailFormState createState() => _UserDetailFormState();
}

class _UserDetailFormState extends State<UserDetailForm> {

  TextEditingController UserID=new TextEditingController();
  TextEditingController Email=new TextEditingController();
  TextEditingController Phone=new TextEditingController();


//For your reference Aashish/kapil

//  Future<List> senddata() async {
//    final response = await http.post("http://raushanjha.in/insertdata.php", body: {
//      "name": name.text,
//      "email": email.text,
//      "mobile":mobile.text,
//    });
//  }
  
  
  

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
                  controller: UserID,
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
                  controller: Email,
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
                  controller: Phone,
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
//              SizedBox(
//                  height: 20.0,
//              ),
              FadeAnimation(
                1.2,
                Container(
                  height: MediaQuery.of(context).size.height /2,

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
          onPressed: () {  },
            child: Icon(Icons.save),
    ),
    );
  }
}
