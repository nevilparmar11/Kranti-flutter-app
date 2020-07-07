import 'dart:async';
import 'package:kranti/theme.dart';
import 'package:kranti/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:kranti/Screens/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => intro_screen()));
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
              gradient: RadialGradient(
                colors: [MyColors.primaryColor, MyColors.primaryColorLight],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70.0,
                backgroundImage: AssetImage("assets/images/grains.png"),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 23.0),
              ),
              Text(
                "THE FAMILY FARM",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
