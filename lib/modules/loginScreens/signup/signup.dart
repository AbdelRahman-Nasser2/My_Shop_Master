// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/shared/components/components.dart';

import '../../../layout/homeLayoutScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.black,
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.values[0],
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset('assets/images/icons&logos/BrandLogo.svg'),
                  Text(
                    "إنشاء حساب",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#1E55A2"),
                    ),
                    textScaleFactor: 1,
                  ),
                  Text(
                    "يرجى ملء التفاصيل لإنشاء حساب",
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //Name
                  Container(
                    width: 300,
                    height: 50,
                    child: text(
                      controller: emailController,
                      input: TextInputType.emailAddress,
                      hint: "الأسم",
                      label: "الأسم",
                      prifix: SvgPicture.asset(
                          "assets/images/icons&logos/Person Profile.svg"),
                      // Image.asset("assets/images/icons&logo/Mail.png")
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Email
                  Container(
                    width: 300,
                    height: 50,
                    child: text(
                      controller: emailController,
                      input: TextInputType.emailAddress,
                      hint: "البريد الإلكترونى",
                      label: " البريد الإلكترونى",
                      prifix: SvgPicture.asset(
                          "assets/images/icons&logos/Mail.svg"),
                      // Image.asset("assets/images/icons&logo/Mail.png")
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Password
                  Container(
                    width: 300,
                    height: 50,
                    child: text(
                        controller: passwordController,
                        input: TextInputType.visiblePassword,
                        hint: "كلمة المرور",
                        label: " كلمة المرور",
                        prifix: SvgPicture.asset(
                            "assets/images/icons&logos/Lock.svg"),
                        suffix: Icons.remove_red_eye_outlined),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // "ابدا"
                  startbutton(
                      text: "سجل",
                      ontap: () {
                        navigateTo(context, HomeLayoutScreen());
                      }),

                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "قم بالتسجيل عبر",
                    style: TextStyle(fontSize: 10),
                  ),
                  Container(
                    width: 200,
                    height: 61,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/images/icons&logos/Facebook logo.svg",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/images/icons&logos/Twitter logo.svg",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/images/icons&logos/Google logo.svg",
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
