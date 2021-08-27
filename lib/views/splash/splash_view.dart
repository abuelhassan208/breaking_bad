import 'dart:async';

import 'package:breaking_bad_bloc/views/home/home_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
            child: Text(
          'loading',
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
