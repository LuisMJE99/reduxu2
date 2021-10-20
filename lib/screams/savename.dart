import 'package:ejemploex/screams/ViewRedux.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Savename extends StatelessWidget {
  static const String id = 'Savename';
  late String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // TextField
          //button
          TextFormField(
            onChanged: (value) {
              name = value;
            },
          ),
          FloatingActionButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString("name", name);
              Navigator.pushNamed(context, ViewRedux.id);
            },
            child: Text('save'),
          )
        ],
      ),
    );
  }
}
