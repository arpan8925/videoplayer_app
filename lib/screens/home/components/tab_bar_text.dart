import 'package:flutter/material.dart';

class TabBarText extends StatelessWidget {
  final String text;
  const TabBarText({required this.text, Key? key}) : super(key: key);

  // text for tab bar
  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}
