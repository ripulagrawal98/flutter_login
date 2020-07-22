import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.blueGrey,
//        appBar: AppBar(
//          title: Text("Second Screen"),
//        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              RaisedButton(
                onPressed: () {
//              Navigator.pop(context);
                  Navigator.pushNamed(context, '/second');
                  // Navigate back to first screen when tapped.
                },
                child: Text('Go back!'),
              ),

            ],

          ),
        ),
      ),
    );
  }
}
