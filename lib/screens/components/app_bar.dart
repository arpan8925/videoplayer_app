import 'package:flutter/material.dart';

class AllAppBar {
  // this is secondary appBar
  static secondaryAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}
