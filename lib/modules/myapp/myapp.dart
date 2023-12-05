import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/login_cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';
import 'package:shop/shared/style/themes.dart';

class MyShop extends StatelessWidget {
  Widget startWidget;

  MyShop({Key? key, required this.startWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AuthCubit(),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          // if (token != null) {
          //   startWidget = startWidget;
          // } else {
          //   startWidget = LoginScreen();
          // }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return MaterialApp(
            theme: lightTheme2,
            debugShowCheckedModeBanner: false,
            // home: CategoryProducts(
            //   id: 43,
            //   categoryName: '',
            // ),
            home: startWidget,
          );
        },
      ),
    );
  }
}
