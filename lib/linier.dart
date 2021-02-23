import 'package:flutter/material.dart';

class ShowProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Text('LinearProgressIndicator'),
            SizedBox(height: 10.0),
            LinearProgressIndicator(),
            SizedBox(height: 50.0),
            Text('CircularProgressIndicator'),
            SizedBox(height: 10.0),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
