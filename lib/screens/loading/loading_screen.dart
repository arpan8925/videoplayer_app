import 'package:flutter/material.dart';
import 'package:videoplayer_app/screens/components/app_bar.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  // loading panel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading"),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
