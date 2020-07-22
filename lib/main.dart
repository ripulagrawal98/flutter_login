import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
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
            Text(
              "Authorization Page",
              style: TextStyle(
                fontFamily: 'LexendZetta',
                fontSize: 25.0,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),

            ),
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
          ],
        ),
      ),
      ),
    );
  }
}


