import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_login/clinicData.dart';

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
  dynamic active, wait_list, wait_time;
  dynamic maxium;

  List<clinicData> cData = [];


//  _DashboardState(
//      this.active, this.maxium, this.waiting_list, this.waiting_time);

  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child("Clinical Data").once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      cData.clear();
//      print("ddatadata::$data");
      for (var key in keys) {
        clinicData d = new clinicData(
          data[key]['active_patients'],
          data[key]['max_patients'],
          data[key]['waiting_list'],
          data[key]['waiting_time'],

        );

        cData.add(d);
        print("lengthlength: ${data}");
      }
      setState(() {
        print('Length: ${cData.length}');
        print("DATADATA: ${cData}");
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < cData.length; i++) {
      active = cData[i].active_patients;
      maxium = cData[i].max_patients;
      wait_list = cData[i].waiting_list;
      wait_time = cData[i].waiting_time;
//      print("active:$active maxium::$maxium waiting_list::: $wait_list wait_time:::: $wait_time");
    }

//    print("$active::$maxium::$wait_list::$wait_time");

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          title: Text("First Screen"),
        ),
        body: Container(

//          child: cData.length == 0 ? new Text('No Data'):
//          new ListView.builder(
//            itemCount: cData.length,
//            itemBuilder: (_,index){
//              return UI(
//                cData[index].active_patients,
//                cData[index].max_patients,
//                cData[index].waiting_list,
//                cData[index].waiting_list,);
//            },
//          ),


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
//                Card(
//
//                  child: cData.length == 0 ? new Text('No Data'):
////                  new ListView.builder(
////                    itemCount: cData.length,
////                    itemBuilder: (_,index){
////                    return UI(
////                    cData[index].active_patients,
////                  cData[index].max_patients,
////                  cData[index].waiting_list,
////                  cData[index].waiting_list,);
////                  },
////                  ),
//                ),


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
                        "Waiting : $wait_list",
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
                        "Your turn in next $wait_time minutes",
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

//  Widget UI(dynamic active_patients, dynamic max_patients, dynamic waiting_list, dynamic waiting_time){
//    return new Card(
//      child: new Container(
//        child: new Column(
//          children: <Widget>[
//            new Text('active_patients:$active_patients'),
//            new Text('maxPatients: $max_patients'),
//            new Text('waitingList: $waiting_list'),
//            new Text('waitingTime: $waiting_time'),
//          ],
//        ),
//      ),
//    );
//  }
}

class UpdateDashboard extends StatefulWidget {
  @override
  _UpdateDashboardState createState() => _UpdateDashboardState();
}

class _UpdateDashboardState extends State<UpdateDashboard> {
  final ref = FirebaseDatabase.instance.reference();
  final name = "Name";
  final active_controller = TextEditingController();
  final max_controller = TextEditingController();
  final waiting_controller = TextEditingController();
  final wait_time_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
//    final ref = fb.reference();
    var retrievedName;
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
                        uploadToFirebase();
                        dynamic active = active_controller.text;
                        dynamic maxium = max_controller.text;
                        dynamic waiting_list = waiting_controller.text;
                        dynamic waiting_time = wait_time_controller.text;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Dashboard()),
                        );
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

  void uploadToFirebase() {
    ref.child("Clinical Data").push().set(
        {
          "active_patients": active_controller.text,
          "max_patients": max_controller.text,
          "waiting_list": waiting_controller.text,
          "waiting_time": wait_time_controller.text,
        }
    );
  }

}


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


