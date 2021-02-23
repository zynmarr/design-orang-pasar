import 'dart:ui';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with WidgetsBindingObserver {
  String token;
  bool obSecure = true;
  String pesan;
  bool load = false;
  bool autoValidate = false;
  var value;

  final _formKey = GlobalKey<FormState>();

  check() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (token == 'AD20385') {
        print('admin driver');
      } else if (token == 'MD082037') {
        print('Member Driver');
      } else if (token == 'PP63829') {
        print('Petugas Pasar');
      } else {
        print('Token Invalid');
      }
    } else {
      setState(() {
        autoValidate = true;
        load = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return OfflineBuilder(
              connectivityBuilder: (context, connectivity, child) {
                final bool connected = connectivity != ConnectivityResult.none;
                if (connectivity == ConnectivityResult.mobile) {
                  print('use Mobile Data');
                } else if (connectivity == ConnectivityResult.wifi) {
                  print('use Wifi Network');
                }
                return Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Petugas Pasar',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.viga().fontFamily,
                                  color: Colors.lightBlueAccent,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                            ),
                            Form(
                              key: _formKey,
                              // ignore: deprecated_member_use
                              autovalidate: autoValidate,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 3,
                                      bottom: 3,
                                    ),
                                    // color: Colors.amberAccent,
                                    child: TextFormField(
                                      onSaved: (val) => token = val,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Token is empty';
                                        }
                                        return null;
                                      },
                                      style: TextStyle(
                                        height: 1,
                                        fontSize: 17,
                                        color: Colors.blueGrey,
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical(y: 0.6),
                                      decoration: InputDecoration(
                                        labelText: 'Token Users',
                                        labelStyle: TextStyle(
                                          fontSize: 17,
                                        ),
                                        focusColor: Colors.lightBlueAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(3),
                            ),
                            pesan != null
                                ? Text(
                                    pesan,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  )
                                : Container(),
                            Padding(
                              padding: EdgeInsets.all(20),
                            ),
                            connected
                                ? RaisedButton(
                                    onPressed: () {
                                      check();
                                      // testManageSpeedInternet();
                                    },
                                    color: Colors.lightBlueAccent,
                                    splashColor: Colors.amberAccent,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      child: Center(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : RaisedButton(
                                    onPressed: () {},
                                    splashColor: Colors.black12,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      child: Center(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Bantuan Lainnya!",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(30),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        height: 30,
                        left: 0.0,
                        right: 0.0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          color: connected ? null : Colors.redAccent,
                          child: connected
                              ? null
                              : Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'OFFLINE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      SpinKitFadingCircle(
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(),
            );
          },
        ),
      ),
    );
  }
}
