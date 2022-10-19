// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/models/loginModel.dart';
import 'package:shop/models/login_Model.dart';
import 'package:shop/shared/cubit/login_cubit/states.dart';
import 'package:shop/shared/network/local/sharedpreference/sharedpreference.dart';
import 'package:shop/shared/network/remote/dio_Helper/dio_Helper.dart';
import 'package:shop/shared/network/remote/end_points.dart';

import '../../../layout/homeLayoutScreen.dart';
import '../../components/components.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postsData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

LoginModel?loginModel;
  void logIn(context, {required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postsData(
        url: LOGIN, data: {'email': email, 'password': password}).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      navigateAndFinish(context, const HomeLayoutScreen());

      CacheHelper.saveData(key: "token", value: loginModel?.data!.token);
      print(loginModel?.data!.token);

      Fluttertoast.showToast(
          msg:"kdkkds",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: HexColor("#1ABC00"),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(LoginSuccessState());
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

}
