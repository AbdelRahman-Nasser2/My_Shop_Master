// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

//تصليح اختفاء ال showcontext  من settings ..editors... intentions

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/home2.dart';
import 'package:shop/layout/homeLayoutScreen.dart';
import 'package:shop/modules/loginScreens/loginScreen/loginScreen.dart';
import 'package:shop/modules/loginScreens/onboardingscreen/onboardingscreen.dart';
import 'package:shop/modules/loginScreens/onboardingscreen/start.dart';
import 'package:shop/shared/components/constant.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';
import 'package:shop/shared/style/themes.dart';

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

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.get(key: "token");
  onBoarding=CacheHelper.get(key: "onBoarding");
  start=CacheHelper.get(key: "start");
  // print(token);
  // print(onBoarding);
  // print(start);
  Widget widget;

  if (token != null) {
    widget = const HomeLayoutScreen();
  }
  else {
    if(onBoarding!=false&&start!=false){
      if(start!=false){
        widget=LoginScreen();

      }else{
        widget=StartPage();

      }
    }
    widget = OnBoardingScreen();
  }
  runApp( MyApp(
    startWidget: widget,

  ));
}

class MyApp extends StatelessWidget {
  Widget startWidget;

   MyApp({Key? key ,required this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return MaterialApp(
            theme: lightTheme2,
            debugShowCheckedModeBanner: false,
            // home: Home2(),
          home: startWidget,
          );

        },
      ),
    );
  }
}
