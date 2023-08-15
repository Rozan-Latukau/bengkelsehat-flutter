import 'dart:async';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:aplikasi_bengkelsehat/theme.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

// ignore: use_key_in_widget_constructors
class SplashScreenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SplashScreenPage> {
  // ignore: annotate_overrides
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/Logo.png',
                height: 98,
                width: 280,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            )
          ],
        ),
      ),
    );
  }
}
