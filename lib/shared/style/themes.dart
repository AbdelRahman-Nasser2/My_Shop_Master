// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  indicatorColor: HexColor("333739"),

  // COLOR: HexColor("333739"),
  // primaryColor: HexColor("333739"),
  colorSchemeSeed: HexColor("333739"),
  scaffoldBackgroundColor: HexColor("333739"),
  appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      backgroundColor: HexColor("333739"),
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: HexColor("333739"),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light),
      elevation: 0.0),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor("333739").withOpacity(1),
  ),
  textTheme: TextTheme(
    displayMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
    //description
    displayLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.blueGrey,
    ),
  ),
  // colorScheme: ColorScheme(background: HexColor("333739")), bottomAppBarTheme: BottomAppBarTheme(color: HexColor("333739")),
);

ThemeData lightTheme = ThemeData(
  indicatorColor: Colors.white,
  primaryColorLight: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      backgroundColor: Colors.white,
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark),
      elevation: 0.0),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    displayMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
    //description
    displayLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.blueGrey,
    ),
  ),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
);

ThemeData lightTheme2 = ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: HexColor("#1E55A2"),
          // statusBarColor: HexColor("#1E55A2"),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark),
    ),
    primaryColor: HexColor("#1E55A2"),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: HexColor("#1E55A2"),
    ));
