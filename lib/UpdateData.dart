import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_login/facility.dart';

//extension ColorExtension on String {
//  toColor() {
//    var hexColor = this.replaceAll("#", "");
//    if (hexColor.length == 6) {
//      hexColor = "FF" + hexColor;
//    }
//    if (hexColor.length == 8) {
//      return Color(int.parse("0x$hexColor"));
//    }
//  }
//}

class UpdateData extends StatefulWidget {
  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final active_controller = TextEditingController();
  dynamic maximum, address, waiting_max, time, clinic_name;

  List<facility> fData = [];

  dynamic active = 0;
  dynamic wait_list = 0;
  DatabaseReference ref = FirebaseDatabase.instance.reference();

  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();

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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
//        backgroundColor: Hexcolor("#F0EFE6"),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    boxShadow: [
                      BoxShadow(
//                      offset: const Offset(3.0,3.0),
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      )
                    ]),
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
//                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.local_hospital,
                        size: 25.0,
                        color: Hexcolor("#00008B"),
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
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
//                      offset: const Offset(3.0,3.0),
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      )
                    ]),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                if (active < maximum) {
                                  active = active + 1;
                                }
                                else if (active < waiting_max) {
                                  if (wait_list < waiting_max) {
                                    wait_list = wait_list + 1;
                                  }
                                }
                              });

                              uploadToFirebase();
//                              active = active + 1;
                            },
                            elevation: 5.0,
                            fillColor: Hexcolor("#00008B"),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
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
                              fontFamily: "Arial",
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Hexcolor("#00008B"),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                if (wait_list > 0) {
                                  wait_list = wait_list - 1;
                                }
                                else if (wait_list == 0) {
                                  if (active > 0) {
                                    active = active - 1;
                                  }
                                }
                              });

                              uploadToFirebase();
                            },
                            elevation: 5.0,
                            fillColor: Hexcolor("#00008B"),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
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
                        "Waiting List: $wait_list/$waiting_max",
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
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(20.0)),
              ),
              SizedBox(
                height: 20.0,
              ),

//              Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  RaisedButton(
//                    elevation: 10.0,
//                    onPressed: () {},
//                    child: Text(
//                      'Take Token',
//                      style: TextStyle(
//                        fontSize: 23.0,
//                        letterSpacing: 0.5,
//                        fontFamily: "Arial",
//                        color: Hexcolor("#00008B"),
//                      ),
//                    ),
//                    color: Colors.white,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(30.0)),
//                  ),
//                  SizedBox(
//                    width: 20.0,
//                  ),
//                  RaisedButton(
//                    elevation: 10.0,
//                    onPressed: () {},
//                    child: Text(
//                      'Book Appointment',
//                      style: TextStyle(
//                        fontSize: 23.0,
//                        letterSpacing: 0.5,
//                        fontFamily: "Arial",
//                        color: Hexcolor("#00008B"),
//                      ),
//                    ),
//                    color: Colors.white,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(30.0)),
//                  ),
//                ],
//              ),

//              RaisedButton(
//                elevation: 10.0,
//                onPressed: () {
//                  uploadToFirebase();
//                  Navigator.pop(context);
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => new Dashboard()));
//                },
//                child: Text(
//                  'Update patients',
//                  style: TextStyle(
//                    fontSize: 23.0,
//                    letterSpacing: 0.5,
//                    fontFamily: "Arial",
//                    color: Hexcolor("#00008B"),
//                  ),
//                ),
//                color: Colors.white,
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(30.0)),
//              ),
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
    ref.child("Clinical Data").push().set({
      "active_patients": active,
      "max_patients": maximum,
      "waiting_list": wait_list,
      "waiting_max": waiting_max,
      "time_patient": time,
      "time": DateTime
          .now()
          .millisecondsSinceEpoch,
    });
  }
}
