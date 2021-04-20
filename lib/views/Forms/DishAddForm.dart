import 'package:flutter/material.dart';
import 'package:food_ordering_app/animation/FadeAnimation.dart';

class DishAddForm extends StatefulWidget {
  @override
  _DishAddFormState createState() => _DishAddFormState();
}

class _DishAddFormState extends State<DishAddForm> {

  String IsAvailable = '';
  String colorGroupValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff409439),
          leading: IconButton(icon: Icon(Icons.menu), onPressed: (){

          }),
          title: Text("             ADD DISH"),
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
                    labelText: "Dish ID*",
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
                    labelText: "Dish name",
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
                    labelText: "Dish Price",
                  ),
                  onChanged: (value) {

                  },

                ),


                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),

              ),

              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40.0,
                  ),
                  Text("Available "),
                  Radio(value: 'Available',
                      groupValue: colorGroupValue,
                      onChanged: (val){
                        colorGroupValue = val;
                        IsAvailable = 'Available';
                        setState(() {

                        });
                      }),
                  SizedBox(
                    width: 50.0,
                  ),

                  Text("Not Available"),
                  Radio(value: 'Not Available',
                      groupValue: colorGroupValue,
                      onChanged: (val){
                        colorGroupValue = val;
                        IsAvailable = 'Not Available';
                        setState(() {

                        });
                      }),

                ],

              ),

              Card(

                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEEEEEE),
                    labelText: "Dish Type",
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
                    labelText: "Restaurant ID",
                  ),
                  onChanged: (value) {

                  },

                ),

                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),

              ),
              FadeAnimation(
                1.2,
                Container(
                  height: MediaQuery.of(context).size.height /4,

                  decoration: BoxDecoration(

                      image: DecorationImage(

                          image: AssetImage('assets/food.png'),
                          fit: BoxFit.fitHeight)),
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
