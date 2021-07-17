import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:videoplayer_app/HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyApp()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Padding(
        padding: const EdgeInsets.only(left: 120.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/01.png",
            width: 130.0,),
            Image.asset("assets/images/load.gif",
            width: 100.0,)
          ],
        ),
      ),
    );
  }
}
