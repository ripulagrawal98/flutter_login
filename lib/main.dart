import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MaterialApp(
//    initialRoute: '/',
//    routes:
//    {
//      // When navigating to the "/" route, build the FirstScreen widget.
//      '/': (context) => SecondScreen(),
//      // When navigating to the "/second" route, build the SecondScreen widget.
//      '/second': (context) => FirstScreen(),
//    },
    home: Dashboard(0, 20, 10, 50),
//    home: UpdateDashboard(),
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
                onPressed: () {
//                  Navigator.pop(context);
//                Navigator.pushNamed(context, '/second');
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
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
                onPressed: () {
                  Navigator.pop(context);
//              Navigator.pushNamed(context, '/second');
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
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

class Dashboard extends StatefulWidget {
  final dynamic active;
  final maxium;
  final dynamic waiting_list;
  final dynamic waiting_time;

  Dashboard(this.active, this.maxium, this.waiting_list, this.waiting_time);

  @override
  _DashboardState createState() =>
      _DashboardState(active, maxium, waiting_list, waiting_time);
}

class _DashboardState extends State<Dashboard> {
  dynamic active, waiting_list, waiting_time;
  dynamic maxium;

  _DashboardState(
      this.active, this.maxium, this.waiting_list, this.waiting_time);

//  dynamic active_patients = 12;
//  int max_patients = 15;
//
//  final int active;

//  void UpdateText() {
//    setState(() {
//      active_patients = active;
//      max_patients = maxium;
//    });
//  }

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
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                color: Colors.lightBlue,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.local_hospital,
                        size: 25.0,
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
                        "$active/$maxium",
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
                        "Waiting : $waiting_list",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "SourceSansPro",
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Your turn in next $waiting_time minutes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "SourceSansPro",
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      )
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
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
//                      UpdateText();
                      //Navigator.pop(context);
//                      Navigator.pushNamed(context, '/second');
                      // Navigate back to first screen when tapped.
                    },
                    child: Text(
                      'Take Token',
                      style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 0.5,
                          fontFamily: "SourceSansPro"),
                    ),
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      print("Pressed");
//              Navigator.pop(context);
//                      Navigator.pushNamed(context, '/second');
                      // Navigate back to first screen when tapped.
                    },
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 0.5,
                          fontFamily: "SourceSansPro"),
                    ),
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
//                  UpdateText();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdateDashboard()),
                  );
                },
                child: Text(
                  'Update patients',
                  style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 0.5,
                      fontFamily: "SourceSansPro"),
                ),
                color: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                color: Colors.white70,
                margin: EdgeInsets.all(20.0),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Advertisement Zone",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Lexend Zetta",
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.05,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateDashboard extends StatefulWidget {
  @override
  _UpdateDashboardState createState() => _UpdateDashboardState();
}

class _UpdateDashboardState extends State<UpdateDashboard> {

  final active_controller = TextEditingController();
  final max_controller = TextEditingController();
  final waiting_controller = TextEditingController();
  final wait_time_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Card(
                color: Colors.lightBlueAccent,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      alignment: Alignment.center,
                      image: AssetImage("images/doodle.png"),
                    ),
                    TextFormField(
                      controller: active_controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        hintText: "Active no of Clients",
                        fillColor: Colors.teal,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: max_controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        hintText: "Capacity of Clinic",
                        fillColor: Colors.teal,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: waiting_controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        hintText: "no of patients in the queue",
                        fillColor: Colors.teal,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: wait_time_controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        hintText: "Time for single patient",
                        fillColor: Colors.teal,
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        dynamic active = active_controller.text;
                        dynamic maxium = max_controller.text;
                        dynamic waiting_list = waiting_controller.text;
                        dynamic waiting_time = wait_time_controller.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Dashboard(active, maxium, waiting_list,
                                      waiting_time)),
                        );
//                    Navigator.pop(context);
                      },
                      child: Text(
                        'Update Dashboard',
                        style: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 0.5,
                            fontFamily: "SourceSansPro"),
                      ),
                      color: Colors.yellowAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
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
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                color: Colors.lightBlue,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.local_hospital,
                        size: 25.0,
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
//
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
                    borderRadius: BorderRadius.circular(20.0)),
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
//                      Navigator.pushNamed(context, '/second');
                      // Navigate back to first screen when tapped.
                    },
                    child: Text(
                      'Take Token',
                      style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 0.5,
                          fontFamily: "SourceSansPro"),
                    ),
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      print("Pressed");
//              Navigator.pop(context);
//                      Navigator.pushNamed(context, '/second');
                      // Navigate back to first screen when tapped.
                    },
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 0.5,
                          fontFamily: "SourceSansPro"),
                    ),
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                color: Colors.white70,
                margin: EdgeInsets.all(20.0),
                child: Padding(
                  padding: EdgeInsets.all(20.0),

//                  child: Text(
//                    "Advertisement Zone",
//                    style: TextStyle(
//                      fontSize: 20.0,
//                      fontFamily: "Lexend Zetta",
//                      fontWeight: FontWeight.bold,
//                      letterSpacing: 0.05,
//                    ),
//                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}


