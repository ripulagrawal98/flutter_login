import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => SecondScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => FirstScreen(),
    },

  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: SafeArea(

        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
              child: Divider(
                color: Colors.black45,
              ),
            ),

            Card(
              color: Colors.blueGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  TextFormField(

                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      hintText: "Email..",

                      fillColor: Colors.teal,

                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontFamily: 'LexendZetta',
                    ),

                  ),
                  SizedBox(
                    height: 20.0,
                    child: Divider(
                      color: Colors.black45,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      hintText: "Password..",
                      fillColor: Colors.teal,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(
                      fontFamily: 'LexendZetta',
                    ),

                  ),
                ],

              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
//                Navigator.pushNamed(context, '/second');
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Text(
                "Log In",
                style: TextStyle(
                  fontFamily: "Lobster",
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
//              Navigator.pushNamed(context, '/second');
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontFamily: "Lobster",
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          title: Text("First Screen"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 100.0),
                color: Colors.lightBlue,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.local_hospital,
                        size:25.0,
                      ),
                      Text(
                        "Gardimeter",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30.0,
                          fontFamily: "Lobster",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200.0),
                ),
              ),
              Card(
                color: Colors.redAccent,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Agrawal's Clinic",
                      style: TextStyle(
                        fontFamily: "SourceSansPro",
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Active_Patients / Max_patients",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "SourceSansPro",
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Waiting List",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "SourceSansPro",
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    )
                  ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                    //Navigator.pop(context);
                      Navigator.pushNamed(context, '/second');
                      // Navigate back to first screen when tapped.
                    },
                    child: Text('Take Token'),
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () {
//              Navigator.pop(context);
                      Navigator.pushNamed(context, '/second');
                      // Navigate back to first screen when tapped.
                    },
                    child: Text('Book Appointment'),
                    color: Colors.yellow,
                  ),
                ],
              )



            ],

          ),
        ),
      ),
    );
  }
}
