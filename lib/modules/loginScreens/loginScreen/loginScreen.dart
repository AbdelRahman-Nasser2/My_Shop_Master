// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:myschool/layout/homeLayoutScreen.dart';
// import 'package:myschool/modules/signup/signup.dart';
// import 'package:myschool/shared/components/components.dart';

// class Loginscreen extends StatefulWidget {
//   const Loginscreen({Key? key}) : super(key: key);

//   @override
//   _LoginscreenState createState() => _LoginscreenState();
// }

// class _LoginscreenState extends State<Loginscreen> {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//   late bool obsecure = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "My Chat",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w100,
//           ),
//         ),
//         flexibleSpace: Container(
//           foregroundDecoration: BoxDecoration(),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.purple, Colors.red],
//               begin: Alignment.bottomCenter,
//               end: Alignment.topLeft,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 40),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   //EmailLogin

//                   text(
//                     validate: (value) {
//                       if (value!.isEmpty) {
//                         return 'Email Adress is required';
//                       }
//                       return null;
//                     },
//                     controller: emailController,
//                     input: TextInputType.emailAddress,
//                     hint: "Enter your email adress",
//                     label: "Your email",
//                     prifix: Icons.email_outlined,
//                   ),
//                   //

//                   SizedBox(
//                     height: 20,
//                   ),

//                   //PassswordLogin

//                   text(
//                       validate: (value) {
//                         if (value!.isEmpty) {
//                           return 'Email Adress is required';
//                         }
//                         return null;
//                       },
//                       controller: passwordController,
//                       password: obsecure,
//                       input: TextInputType.visiblePassword,
//                       hint: 'Enter your password',
//                       label: "Your password",
//                       prifix: Icons.lock,
//                       suffix: Icons.remove_red_eye,
//                       suffixpressed: () {
//                         setState(() {
//                           obsecure = !obsecure;
//                         });
//                       }),

//                   SizedBox(
//                     height: 8,
//                   ),

//                   Container(
//                     alignment: Alignment.centerRight,
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     child: Text(
//                       "Forgot Password?",
//                       style: TextStyle(
//                         textBaseline: TextBaseline.ideographic,
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),

//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 80, right: 80, top: 20, bottom: 20),
//                     child: Container(
//                       foregroundDecoration: BoxDecoration(),
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Colors.purple, Colors.red],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topLeft,
//                           ),
//                           borderRadius: BorderRadius.circular(30)),
//                       child: MaterialButton(
//                         autofocus: true,
//                         onPressed: () {
//                           if (formKey.currentState!.validate()) {
//                             print(emailController.text);
//                           }
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => homeLayoutScreen()),
//                           );
//                         },
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               fontStyle: FontStyle.italic),
//                         ),
//                       ),
//                     ),
//                   ),

//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Text(
//                         "Don't have account?  ",
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                           decorationThickness: 10,
//                           color: Colors.white,
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => signUpScreen()),
//                           );
//                         },
//                         child: Text(
//                           "Register Now",
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             fontStyle: FontStyle.italic,
//                             fontWeight: FontWeight.bold,
//                             decorationThickness: 10,
//                             decorationStyle: TextDecorationStyle.wavy,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "Or use social account to login",
//                     style: TextStyle(
//                       color: Color(0x98FFFFFF),
//                       fontSize: 14,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),

//                   SizedBox(
//                     height: 20,
//                   ),

//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       FaIcon(
//                         FontAwesomeIcons.facebook,
//                         size: 50,
//                         color: Colors.white,
//                         // color: Color(0x773124A1),
//                       ),
//                       SizedBox(
//                         width: 40,
//                       ),
//                       FaIcon(
//                         FontAwesomeIcons.google,
//                         size: 50,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/layout/homeLayoutScreen.dart';
import 'package:shop/modules/loginScreens/signup/signup.dart';
import 'package:shop/shared/cubit/login_cubit/cubit.dart';
import 'package:shop/shared/cubit/login_cubit/states.dart';

import '../../../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.values[0],
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                            'assets/images/icons&logos/BrandLogo.svg'),
                        Text(
                          "سجل دخولك الأن",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: HexColor("#1E55A2"),
                          ),
                          textScaleFactor: 1,
                        ),
                        Text(
                          "يرجى تسجيل الدخول لمتابعة استخدام التطبيق",
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 300,
                          height: 50,
                          child: text(
                            controller: emailController,
                            input: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "هذا الحقل مطلوب";
                              }
                            },
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
                        Container(
                          width: 300,
                          height: 50,
                          child: text(
                            controller: passwordController,
                            input: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "هذا الحقل مطلوب";
                              }
                            },
                            hint: "كلمة المرور",
                            label: " كلمة المرور",
                            prifix: Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Icon(Icons.remove_red_eye_outlined),
                            ),
                            suffixx: SvgPicture.asset(
                                "assets/images/icons&logos/Lock.svg"),
                          ),
                        ),

                        //reset password
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "نسيت كلمة المرور ؟",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  textScaleFactor: 1,
                                ),
                              ),
                            ],
                          ),
                        ),


                        //flutter run -d chrome --web-renderer html

                        SizedBox(
                          height: 20,
                        ),
                        // "ابدا"
                        ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => startbutton(
                                text: "ابدا",
                                ontap: () {
                                  if (formkey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                    navigateTo(context, HomeLayoutScreen());
                                  }
                                }),
                            fallback: (context) => Center(
                                  child: CircularProgressIndicator(),
                                )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                navigateTo(context, SignUpScreen());
                              },
                              child: Text(
                                "سجل الاَن",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#1E55A2"),
                                ),
                              ),
                            ),
                            Text(
                              ".لا تمتلك حساب",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: HexColor("#636363"),
                              ),
                            ),
                          ],
                        ),
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
        },
      ),
    );
  }
}
