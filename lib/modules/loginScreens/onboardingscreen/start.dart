// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/shared/components/components.dart';

import '../loginScreen/loginScreen.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/fristcover.jpg')),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Text(""),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.values[0],
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset('assets/images/icons&logos/BrandLogo.svg'),
              SizedBox(
                height: 50,
              ),
              Text(
                '''مرحبا''',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: HexColor("#1E55A2"),
                ),
                textScaleFactor: 2,
              ),
              Text(
                '''قم بالبدء لتحصل على كل المنتجات الرائعة
              هناك الكثير بإنتظارك''',
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                height: 100,
              ),
              // "ابدا"
              startbutton(
                  text: "ابدا",
                  ontap: () {
                    navigateAndFinish(context, LoginScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
