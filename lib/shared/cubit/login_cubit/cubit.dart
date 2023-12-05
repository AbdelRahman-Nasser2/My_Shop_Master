import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/models/loginModel.dart';
import 'package:shop/models/logoutmodel.dart';
import 'package:shop/models/signUpModel.dart';
import 'package:shop/shared/cubit/login_cubit/states.dart';
import 'package:shop/shared/network/local/sharedpreference/sharedpreference.dart';
import 'package:shop/shared/network/remote/dio_Helper/dio_Helper.dart';
import 'package:shop/shared/network/remote/end_points.dart';

import '../../../layout/homelayoutscreen.dart';
import '../../components/components.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(LoginInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postsData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      // print(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  var loginFormKey = GlobalKey<FormState>();
  var loginEmailController = TextEditingController();
  var loginPasswordController = TextEditingController();

  IconData prefix = Icons.visibility_outlined;
  bool isPassword = false;
  void changeEye() {
    isPassword = !isPassword;
    prefix = (isPassword)
        ? prefix = Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangeEyePassword());
  }

  LoginModel? loginModel;
  void logIn(context, {required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postsData(
        url: LOGIN, data: {'email': email, 'password': password}).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      if (error is DioError) {
        showToast(
            state: ToastStates.ERROR,
            text: error.response!.data!['message'].toString());
      }

      if (kDebugMode) {
        print(error.toString());
      }
      emit(LoginErrorState(error.toString()));
    });
  }

  LogOutModel? logOutModel;
  void logOut({required token}) {
    emit(LogOutLoadingState());
    DioHelper.postsData(
      url: LOGOUT,
      token: token,
      data: {},
    ).then((value) {
      logOutModel = LogOutModel.fromJson(value.data);
      print(logOutModel!.message!);
      emit(LogOutSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        showToast(
            state: ToastStates.ERROR,
            text: error.response!.data!['message'].toString());
      }

      if (kDebugMode) {
        print(error.toString());
      }
      emit(LogOutErrorState(error.toString()));
    });
  }

  // SignUpModel signUpModel;
  SignUpModel? signUpModel;
  void signUP(
    context, {
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postsData(url: SIGNUP, data: {
      "firstName": name,
      "phone": phone,
      "email": email,
      "password": password,
    }).then((value) {
      // print(value.data);
      signUpModel = SignUpModel.fromJson(value.data);
      if (signUpModel?.status == true) {
        navigateAndFinish(context, const HomeLayoutScreen());
      }

      CacheHelper.saveData(key: "token", value: signUpModel?.data!.token);

      Fluttertoast.showToast(
          msg: "${signUpModel?.message}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: HexColor("#1ABC00"),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(SignUpSuccessState(signUpModel!));
    }).catchError((error) {
      if (error is DioError) {
        showToast(
            state: ToastStates.ERROR,
            text: error.response!.data!['message'].toString());
      }

      if (kDebugMode) {
        print(error.toString());
      }
      emit(SignUpErrorState(error.toString()));
    });
  }
}
