import 'package:flutter/material.dart';

class My extends StatefulWidget {
  My({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _my createState() => _my();
}

// ignore: camel_case_types
class _my extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Column(
          children: <Widget>[
            new Row(

                children: <Widget>[
                  new Text("data")
                ]
            )
          ]
      ),
    );
  }
}
