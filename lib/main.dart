import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_login/clinicData.dart';
import 'package:flutter_login/UpdateData.dart';
import 'package:flutter_login/Switch_User_Admin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_login/facility.dart';

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
    home: Dashboard(),
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

  @override
  _DashboardState createState() =>
      _DashboardState();
}

class _DashboardState extends State<Dashboard> {

//  DatabaseReference ref = FirebaseDatabase.instance.reference();

  dynamic maxium;

  dynamic maximum, address, waiting_max, time, clinic_name;

  List<clinicData> cData = [];
  List<facility> fData = [];

  dynamic active = 0;
  dynamic wait_list = 0;

  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();

    ref.child("Clinical Data").limitToLast(1).once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      dynamic data = snap.value;
      cData.clear();

      for (var key in keys) {
        clinicData d = new clinicData(
          data[key]['active_patients'],
          data[key]['max_patients'],
          data[key]['waiting_list'],
          data[key]['waiting_max'],
          data[key]['time_patient'],
        );
        cData.add(d);
      }
      setState(() {});
    });

    ref.child("Facility").once().then((DataSnapshot snap) {
//      dynamic data = snap.value;

      var keys = snap.value.keys;
      dynamic data = snap.value;
      fData.clear();

      for (var key in keys) {
        facility f = new facility(data['Clinic_Name'], data['maximum'],
            data['Address'], data['Time'], data['waiting_max']);

        fData.add(f);
      }

      setState(() {
//        maximum = data;
        print("PEACOCK$data");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < fData.length; i++) {
      maximum = fData[i].maximum;
      address = fData[i].Address;
      time = fData[i].Time;
      waiting_max = fData[i].waiting_max;
      clinic_name = fData[i].Clinic_Name;
    }

    for (var i = 0; i < cData.length; i++) {
      active = cData[i].active_patients;
      maxium = cData[i].max_patients;
      time = cData[i].time_patient;
      waiting_max = cData[i].waiting_max;
      wait_list = cData[i].waiting_list;
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)
                    ),
                    boxShadow: [
                      BoxShadow(
//                      offset: const Offset(3.0,3.0),
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      )
                    ]
                ),
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.local_hospital,
                        color: Hexcolor("#00008B"),
                        size: 25.0,
                      ),
                      Text(
                        "Gardimeter",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: "Arial",
                          fontWeight: FontWeight.bold,
                          color: Hexcolor("#00008B"),
                        ),
                      ),
                    ],
                  ),
                ),
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(200.0),
//                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)
                    ),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
//                      offset: const Offset(3.0,3.0),
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      )
                    ]

                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "$clinic_name",
                        style: TextStyle(
                          fontFamily: "Arial",
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Hexcolor("#00008B"),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "$address",
                        style: TextStyle(
                          fontFamily: "Arial",
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Hexcolor("#00008B"),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "$active/$maxium",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Arial",
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Hexcolor("#00008B"),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Waiting List: $wait_list/$waiting_max ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Arial",
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Hexcolor("#00008B"),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Next Turn: $time minutes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Arial",
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Hexcolor("#00008B"),
                        ),
                      )
                    ],
                  ),
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
                    elevation: 10.0,
                    onPressed: () {},
                    child: Text(
                      'Take Token',
                      style: TextStyle(
                          fontSize: 23.0,
                          letterSpacing: 0.5,
                          fontFamily: "Arial",
                          color: Hexcolor("#00008B")),
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    elevation: 10.0,
                    onPressed: () {},
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(
                          fontSize: 23.0,
                          letterSpacing: 0.5,
                          fontFamily: "Arial",
                          color: Hexcolor("#00008B")),
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ],
              ),

//              RaisedButton(
//                onPressed: () {
////                  UpdateText();
////                  Navigator.push(
////                    context,
////                    MaterialPageRoute(builder: (context) => UpdateDashboard()),
////                  );
////                },
//                  Navigator.push(context,
//                      MaterialPageRoute(
//                          builder: (context) => new UpdateData()));
//                },
//                child: Text(
//                  'Update patients',
//                  style: TextStyle(
//                      fontSize: 20.0,
//                      letterSpacing: 0.5,
//                      fontFamily: "SourceSansPro"),
//                ),
//
//                color: Colors.deepPurpleAccent,
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(30.0)),
//              ),

              SizedBox(
                height: 20.0,
              ),

              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(30.0)
                    ),
                    boxShadow: [
                      BoxShadow(
//                      offset: const Offset(3.0,3.0),
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      )
                    ]

                ),
                margin: EdgeInsets.all(20.0),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Advertisement Zone",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.05,
                      color: Hexcolor("#00008B"),
                    ),
                  ),
                ),
              )


            ],
          ),


        ),
      ),
    );
  }
}

//class UpdateDashboard extends StatefulWidget {
//  @override
//  _UpdateDashboardState createState() => _UpdateDashboardState();
//}
//
//class _UpdateDashboardState extends State<UpdateDashboard> {
//  final ref = FirebaseDatabase.instance.reference();
//  final name = "Name";
//  final active_controller = TextEditingController();
//  final max_controller = TextEditingController();
//  final waiting_controller = TextEditingController();
//  final wait_time_controller = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {


//    return MaterialApp(
//      home: Scaffold(
//        backgroundColor: Colors.lightBlueAccent,
//        body: SafeArea(
//          child: ListView(
//            children: <Widget>[
//              Card(
//                color: Colors.lightBlueAccent,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Image(
//                      alignment: Alignment.center,
//                      image: AssetImage("images/doodle.png"),
//                    ),
//                    TextFormField(
//                      controller: active_controller,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(25.0)
//                        ),
//                        hintText: "Active no of Clients",
//                        fillColor: Colors.teal,
//                      ),
//                      keyboardType: TextInputType.number,
//                    ),
//                    SizedBox(
//                      height: 20.0,
//                    ),
//                    TextFormField(
//                      controller: max_controller,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(25.0)
//                        ),
//                        hintText: "Capacity of Clinic",
//                        fillColor: Colors.teal,
//                      ),
//                      keyboardType: TextInputType.number,
//                    ),
//                    SizedBox(
//                      height: 20.0,
//                    ),
//                    TextFormField(
//                      controller: waiting_controller,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(25.0)
//                        ),
//                        hintText: "no of patients in the queue",
//                        fillColor: Colors.teal,
//                      ),
//                      keyboardType: TextInputType.number,
//                    ),
//                    SizedBox(
//                      height: 20.0,
//                    ),
//                    TextFormField(
//                      controller: wait_time_controller,
//                      decoration: InputDecoration(
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(25.0)
//                        ),
//                        hintText: "Time for single patient",
//                        fillColor: Colors.teal,
//                      ),
//                      keyboardType: TextInputType.datetime,
//                    ),
//                    SizedBox(
//                      height: 20.0,
//                    ),
//                    RaisedButton(
//                      onPressed: () {
//                        uploadToFirebase();
//                        dynamic active = active_controller.text;
//                        dynamic maxium = max_controller.text;
//                        dynamic waiting_list = waiting_controller.text;
//                        dynamic waiting_time = wait_time_controller.text;
//
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) =>
//                                  Dashboard()),
//                        );
//                      },
//                      child: Text(
//                        'Update Dashboard',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            letterSpacing: 0.5,
//                            fontFamily: "SourceSansPro"),
//                      ),
//                      color: Colors.yellowAccent,
//                      shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(30.0)),
//                    ),
//
//                  ],
//                ),
//              ),
//
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  void uploadToFirebase() {
//    ref.child("Clinical Data").push().set(
//        {
//          "active_patients": active_controller.text,
//          "max_patients": max_controller.text,
//          "waiting_list": waiting_controller.text,
//          "waiting_time": wait_time_controller.text,
//        }
//    );
//  }
//
//}
//

//class SecondScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        backgroundColor: Colors.tealAccent,
//        appBar: AppBar(
//          title: Text("First Screen"),
//        ),
//        body: Center(
//          child: Column(
//            children: <Widget>[
//              Card(
//                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
//                color: Colors.lightBlue,
//                child: Padding(
//                  padding: EdgeInsets.all(5.0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Icon(
//                        Icons.local_hospital,
//                        size: 25.0,
//                      ),
//                      Text(
//                        "Gardimeter",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          fontStyle: FontStyle.italic,
//                          fontSize: 30.0,
//                          fontFamily: "Lobster",
//                          color: Colors.black,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(200.0),
//                ),
//              ),
//              Card(
//                color: Colors.redAccent,
//                child: Padding(
//                  padding: EdgeInsets.all(20.0),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        "Agrawal's Clinic",
//                        style: TextStyle(
//                          fontFamily: "SourceSansPro",
//                          fontSize: 25.0,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.black,
//                        ),
//                      ),
//                      SizedBox(
//                        height: 10.0,
//                      ),
////
//                      Text(
//                        "Active_Patients / Max_patients",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          fontFamily: "SourceSansPro",
//                          fontSize: 35.0,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.black,
//                        ),
//                      ),
//                      SizedBox(
//                        height: 10.0,
//                      ),
//                      Text(
//                        "Waiting List",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          fontFamily: "SourceSansPro",
//                          fontSize: 25.0,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.white70,
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(20.0)),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  RaisedButton(
//                    onPressed: () {
//                      //Navigator.pop(context);
////                      Navigator.pushNamed(context, '/second');
//                      // Navigate back to first screen when tapped.
//                    },
//                    child: Text(
//                      'Take Token',
//                      style: TextStyle(
//                          fontSize: 20.0,
//                          letterSpacing: 0.5,
//                          fontFamily: "SourceSansPro"),
//                    ),
//                    color: Colors.yellow,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(30.0)),
//                  ),
//                  SizedBox(
//                    width: 20.0,
//                  ),
//                  RaisedButton(
//                    onPressed: () {
//                      print("Pressed");
////              Navigator.pop(context);
////                      Navigator.pushNamed(context, '/second');
//                      // Navigate back to first screen when tapped.
//                    },
//                    child: Text(
//                      'Book Appointment',
//                      style: TextStyle(
//                          fontSize: 20.0,
//                          letterSpacing: 0.5,
//                          fontFamily: "SourceSansPro"),
//                    ),
//                    color: Colors.yellow,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(30.0)),
//                  ),
//                ],
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              Card(
//                color: Colors.white70,
//                margin: EdgeInsets.all(20.0),
//                child: Padding(
//                  padding: EdgeInsets.all(20.0),
//
////                  child: Text(
////                    "Advertisement Zone",
////                    style: TextStyle(
////                      fontSize: 20.0,
////                      fontFamily: "Lexend Zetta",
////                      fontWeight: FontWeight.bold,
////                      letterSpacing: 0.05,
////                    ),
////                  ),
//                ),
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(20.0)),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}


