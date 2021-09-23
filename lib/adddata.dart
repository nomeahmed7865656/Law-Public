import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add_data extends StatefulWidget {
  @override
  _Add_dataState createState() => _Add_dataState();
}

class _Add_dataState extends State<Add_data> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff999999),
        appBar: AppBar(
          backgroundColor: Color(0xff2f3649),
          title: Text("Enter Case Data Here"),
        ),
      ),
    );
  }
}
