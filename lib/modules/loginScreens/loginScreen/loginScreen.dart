// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/layout/homelayoutscreen.dart';
import 'package:shop/modules/loginScreens/signup/signup.dart';
import 'package:shop/shared/components/constant.dart';
import 'package:shop/shared/cubit/login_cubit/cubit.dart';
import 'package:shop/shared/cubit/login_cubit/states.dart';
import 'package:shop/shared/network/local/sharedpreference/sharedpreference.dart';
import 'package:shop/test.dart';

import '../../../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status == true) {
              CacheHelper.saveData(
                      key: "token", value: state.loginModel.data!.token)
                  .then((value) {
                token = CacheHelper.get(key: "token");
                showToast(
                    state: ToastStates.SUCCESS, text: state.loginModel.message);
                navigateAndFinish(context, const HomeLayoutScreen());
              });
            } else {
              showToast(
                  state: ToastStates.ERROR, text: state.loginModel.message);
            }
          }

          if (state is ChangeEyePassword) {
            AuthCubit().isPassword = !AuthCubit().isPassword;
          }
        },
        builder: (context, state) {
          var loginCubit = AuthCubit.get(context);

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
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: loginCubit.loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,

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
                        // width: 300,
                        height: 60,
                        width: double.infinity,

                        child: text(
                          controller: loginCubit.loginEmailController,
                          input: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'email must be not empty';
                            } else if (!value.toString().contains('@') ||
                                !value.toString().contains('.com')) {
                              return 'ex: example@mail.com';
                            } else {
                              return null;
                            }
                          },
                          hint: "البريد الإلكترونى",
                          label: " البريد الإلكترونى",
                          suffix: SvgPicture.asset(
                            "assets/images/icons&logos/Mail.svg",
                            fit: BoxFit.none,
                          ),
                          prefix: null,
                          // Image.asset("assets/images/icons&logo/Mail.png")
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // width: 300,
                        width: double.infinity,
                        height: 60,
                        child: text(
                          controller: loginCubit.loginPasswordController,
                          input: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "this field is required";
                            }
                            return null;
                          },
                          hint: "كلمة المرور",
                          label: " كلمة المرور",
                          onSubmit: (value) async {
                            if (loginCubit.loginFormKey.currentState!
                                .validate()) {
                              loginCubit.logIn(context,
                                  email: loginCubit.loginEmailController.text,
                                  password:
                                      loginCubit.loginPasswordController.text);
                            }
                          },
                          password: loginCubit.isPassword,
                          prefixPressed: () {
                            loginCubit.changeEye();
                          },
                          prefix: Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Icon(loginCubit.prefix),
                          ),
                          suffix: SvgPicture.asset(
                            "assets/images/icons&logos/Lock.svg",
                            fit: BoxFit.none,
                          ),
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
                              onPressed: () {
                                navigateTo(context, HomePageWidget());
                              },
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
                          builder: (context) => startButton(
                              text: "ابدا",
                              ontap: () async {
                                if (loginCubit.loginFormKey.currentState!
                                    .validate()) {
                                  loginCubit.logIn(context,
                                      email:
                                          loginCubit.loginEmailController.text,
                                      password: loginCubit
                                          .loginPasswordController.text);
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
          );
        },
      ),
    );
  }
}
