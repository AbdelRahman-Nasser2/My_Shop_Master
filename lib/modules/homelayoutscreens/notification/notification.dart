// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class notificationScreen extends StatelessWidget {
  const notificationScreen ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Notification Screen",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}




















