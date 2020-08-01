import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/main.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class UpdateData extends StatefulWidget {
  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final active_controller = TextEditingController();
  dynamic maximum;

  dynamic active = 0;
  DatabaseReference ref = FirebaseDatabase.instance.reference();

  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var l = ref.child("Clinical Data");
    ref
        .child("Clinical Data")
        .child("maximum")
        .once()
        .then((DataSnapshot snap) {
      //      var keys = snap.value;
      int data = snap.value;
      setState(() {
        maximum = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        backgroundColor: Colors.white,
        backgroundColor: "#F0EFE6".toColor(),

        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                color: '#00B9F1'.toColor(),
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
                color: '#00B9F1'.toColor(),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                if (active < maximum) {
                                  active = active + 1;
                                }
                              });
//                              active = active + 1;
                            },
                            elevation: 2.0,
                            fillColor: "#F0EFE6".toColor(),
                            child: Icon(
                              Icons.add,
                              size: 22.0,
                            ),
                            shape: CircleBorder(),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "$active/$maximum",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                if (active > 0) {
                                  active = active - 1;
                                }
                              });
                            },
                            elevation: 2.0,
                            fillColor: "#F0EFE6".toColor(),
                            child: Icon(
                              Icons.remove,
                              size: 22.0,
                            ),
                            shape: CircleBorder(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Waiting",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "SourceSansPro",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Next Turn: 30 minutes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "SourceSansPro",
                          fontSize: 20.0,
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
                    onPressed: () {},
                    child: Text(
                      'Take Token',
                      style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 0.5,
                          fontFamily: "SourceSansPro"),
                    ),
                    color: '#00B9F1'.toColor(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 0.5,
                          fontFamily: "SourceSansPro"),
                    ),
                    color: '#00B9F1'.toColor(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  uploadToFirebase();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Dashboard()));
                },
                child: Text(
                  'Update patients',
                  style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 0.5,
                      fontFamily: "SourceSansPro"),
                ),
                color: '#00B9F1'.toColor(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              SizedBox(
                height: 20.0,
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
          "active_patients": active,
          "max_patients": maximum
        }
    );
  }
}
