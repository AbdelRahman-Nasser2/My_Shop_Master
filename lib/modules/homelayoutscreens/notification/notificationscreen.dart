// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/models/notificationmodel.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getNotificationData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates states) {},
        builder: (BuildContext context, AppStates states) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: cubit.normalAppBar(context,
                  showSearch: true, addChild: false, height: 130),
            ),
            body: ConditionalBuilder(
              condition: states is! NotificationDataLoading,
              builder: (BuildContext context) {
                return ListView.separated(
                  padding:
                      EdgeInsets.only(top: 15, right: 5, left: 5, bottom: 10),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => notificationItem(
                      cubit.notificationModel!.data!.data![index]),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: cubit.notificationModel!.data!.data!.length,
                );
              },
              fallback: (BuildContext context) {
                return Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }

  Widget notificationItem(NotificationData model) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 1)],
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(40), right: Radius.circular(40)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios, color: HexColor('#1E55A2')),
            Spacer(),
            Text(
              '${model.title}',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: HexColor('#1E55A2'),
              child: Icon(
                Icons.notifications_active,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
