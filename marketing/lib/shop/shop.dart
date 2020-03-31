import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  Shop({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _shop createState() => _shop();
}
// ignore: camel_case_types
class _shop extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("shop"),
      ),
    );
  }
}