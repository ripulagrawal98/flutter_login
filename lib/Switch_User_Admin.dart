import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_login/main.dart';
import 'UpdateData.dart';

void main() => runApp(new MaterialApp(home: new User_Admin()));

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

class User_Admin extends StatefulWidget {
  @override
  _User_AdminState createState() => _User_AdminState();
}

class _User_AdminState extends State<User_Admin> {
  List<bool> isSelected = [false, false];
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: "#F0EFE6".toColor(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Patient"),
                SizedBox(
                  height: 10.0,
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;

                      if (isSwitched == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new UpdateData()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new Dashboard()));
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("Doctor"),
              ],
            ),

//              ToggleButtons(
//                children: <Widget>[
//                  Text("Admin"),
//                  Text("User"),
//                ],
//                isSelected: isSelected,
//                onPressed: (int index) {
//                  setState(() {
//                    isSelected[index] = !isSelected[index];
//                  });
//                },
//              )
          ],
        ),
      ),
    );
  }
}
