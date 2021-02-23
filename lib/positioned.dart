import 'package:design_orang_pasar/linier.dart';
import 'package:flutter/material.dart';

class ShowPosition extends StatefulWidget {
  @override
  _ShowPositionState createState() => _ShowPositionState();
}

class _ShowPositionState extends State<ShowPosition> {
  double _top = 0.0;
  double _left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.grey[300],
                height: 250.0,
              ),
              Positioned(
                top: this._top,
                left: this._left,
                child: ClipOval(
                  child: Container(
                    height: 100.0,
                    width: 200.0,
                    color: Colors.teal[200],
                    child: FlutterLogo(
                      // colors: Colors.blueGrey,
                      size: 100.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Text('TOP:'),
          Slider(
            value: this._top,
            min: 0.0,
            max: 150.0,
            onChanged: (double val) {
              setState(() {
                this._top = val;
              });
            },
          ),
          SizedBox(
            height: 40.0,
          ),
          Text('LEFT:'),
          Slider(
            value: this._left,
            min: 0.0,
            max: 210.0,
            onChanged: (double val) {
              setState(() {
                this._left = val;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(30),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ShowProgressIndicator(),
                ),
              );
            },
            child: Text('Linear'),
          ),
        ],
      ),
    );
  }
}
