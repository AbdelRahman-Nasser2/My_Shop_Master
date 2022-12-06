// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';

class ModelCategoryScreen extends StatelessWidget {
  final String image;
  final String title;
  final List<Widget> children;

  const ModelCategoryScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates states) {},
        builder: (BuildContext context, AppStates states) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(90),
            //   child: cubit.NormalAppBar(
            //     context,
            //   ),
            // ),
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        title,
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Expanded(
                      //   child: GridView.builder(
                      //       padding: EdgeInsets.symmetric(horizontal: 20),
                      //       gridDelegate:
                      //           SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 2,
                      //         crossAxisSpacing: 0,
                      //         mainAxisSpacing: 0,
                      //       ),
                      //       itemBuilder: (context, index) => Container(
                      //             height: 500,
                      //             width: 150,
                      //             child:
                      //                 Image.asset("images/categeory/sp1.png"),
                      //           )),
                      // ),
                      Expanded(
                        child: GridView.custom(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 30,
                                  crossAxisSpacing: 30),
                          childrenDelegate:
                              SliverChildListDelegate.fixed(children),
                        ),
                      ),
                    ],
                  ),
                ),
                cubit.normalAppBar(context,
                    height: 90,
                    opacity: 0.9,
                    addChild: false,
                    showSearch: false),
              ],
            ),
          );
        });
  }
}
