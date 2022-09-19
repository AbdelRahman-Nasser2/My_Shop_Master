// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class profileScreen extends StatelessWidget {
  const profileScreen ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}




















