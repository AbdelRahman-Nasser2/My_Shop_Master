// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

//تصليح اختفاء ال showcontext  من settings ..editors... intentions
//woufhhawoicygwa
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop/layout/homelayoutscreen.dart';
import 'package:shop/modules/loginScreens/loginScreen/loginScreen.dart';
import 'package:shop/modules/loginScreens/onboardingscreen/onboardingscreen.dart';
import 'package:shop/modules/myapp/myapp.dart';
import 'package:shop/restart.dart';
import 'package:shop/shared/components/constant.dart';

import 'shared/network/local/sharedpreference/sharedpreference.dart';
import 'shared/network/remote/dio_Helper/dio_Helper.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.get(key: "token");
  onBoarding = CacheHelper.get(key: "onBoarding");
  start = CacheHelper.get(key: "start");
  print(token);
  // print(onBoarding);
  // print(start);
  Widget widget;
  if (token != null) {
    widget = const HomeLayoutScreen();
  } else {
    if (onBoarding != true && start != true) {
      widget = OnBoardingScreen();
      // if (start != false) {
      //   widget = LoginScreen();
      // } else {
      //   widget = StartPage();
      // }
    } else {
      widget = LoginScreen();
    }
  }
  runApp(
    RestartWidget(
      child: MyShop(
        startWidget: widget,
      ),
    ),
    //
  );
}
