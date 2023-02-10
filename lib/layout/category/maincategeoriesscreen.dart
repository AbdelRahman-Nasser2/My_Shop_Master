// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';

class MainCategoryScreen extends StatelessWidget {
  const MainCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
        AppCubit cubit = AppCubit.get(context);
        List categories = cubit.categoriesModel!.data!.data;

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: cubit.normalAppBar(
              context,
              showSearch: true,
              addChild: false,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15, left: 5, right: 5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "التصنيفات",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    itemBuilder: (context, index) => categoryItem(
                      context,
                      categories[index],
                      fontTittleSize: 20,
                      height: 180,
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 30,
                    ),
                    itemCount: categories.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//Container(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(),
//               height: 70,
//               child: Row(
//                 children: [
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.person,
//                         size: 30,
//                       ),
//                       Text("الحساب")
//                     ],
//                   ),
//                   Spacer(),
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.person,
//                         size: 30,
//                       ),
//                       Text("الحساب")
//                     ],
//                   ),
//                   Spacer(),
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.person,
//                         size: 30,
//                       ),
//                       Text("الحساب")
//                     ],
//                   ),
//                   Spacer(),
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.person,
//                         size: 30,
//                       ),
//                       Text("الحساب")
//                     ],
//                   ),
//                 ],
//               ),
//             ),
