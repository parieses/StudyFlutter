import 'package:flutter/material.dart';

class Class extends StatefulWidget {
  Class({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _class createState() => _class();
}
// ignore: camel_case_types
class _class extends State<Class> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("class"),
      ),
    );
  }
}