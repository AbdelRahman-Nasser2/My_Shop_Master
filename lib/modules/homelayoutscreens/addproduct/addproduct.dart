// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/shared/style/colors.dart';

import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates states) {},
        builder: (BuildContext context, AppStates states) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 5,
                    height: 5,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor('#000000'),
                          )
                        ]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(children: [
                              Text(
                                'Smart Watch',
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              // السعر
                              Row(
                                children: [
                                  Text(
                                    'جنيه',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    '50.30',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'السعر',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              //  الكمية
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: HexColor('#D2D2D2'),
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          child: FloatingActionButton(
                                            clipBehavior: Clip.antiAlias,
                                            mini: true,
                                            backgroundColor: defaultColor,
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        CircleAvatar(
                                          radius: 15,
                                          child: FloatingActionButton(
                                            clipBehavior: Clip.antiAlias,
                                            mini: true,
                                            backgroundColor:
                                                HexColor('#406497'),
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Container(
                                          height: 20,
                                          width: 30,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: HexColor('#707070'))),
                                          child: Center(
                                            child: Text(
                                              '3',
                                              style: GoogleFonts.lato(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: defaultColor),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    'الكمية',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              Divider(
                                thickness: 5,
                                height: 5,
                                color: Colors.black,
                              ),

                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'جنيه',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '150,9',
                                    style: GoogleFonts.lato(
                                        fontSize: 21,
                                        color: HexColor('#F99100'),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ]),
                            VerticalDivider(
                              thickness: 5,
                              width: 6,
                              color: Colors.black12,
                            ),
                            Expanded(child: Column()),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      itemBuilder: (context, index) => SizedBox(
                            width: double.infinity,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shadowColor: HexColor('#000000'),
                              color: Colors.white,
                              borderOnForeground: true,
                              elevation: 20,
                              shape: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 9, left: 9, right: 14, bottom: 18),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: HexColor('#1B2538'),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Smart Watch',
                                              style: GoogleFonts.lato(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            // السعر
                                            Row(
                                              children: [
                                                Text(
                                                  'جنيه',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 13,
                                                ),
                                                Text(
                                                  '50.30',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 13,
                                                ),
                                                Text(
                                                  'السعر',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),

                                            //  الكمية
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(5),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#D2D2D2'),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 15,
                                                        child:
                                                            FloatingActionButton(
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          mini: true,
                                                          backgroundColor:
                                                              defaultColor,
                                                          onPressed: () {},
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                      CircleAvatar(
                                                        radius: 15,
                                                        child:
                                                            FloatingActionButton(
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          mini: true,
                                                          backgroundColor:
                                                              HexColor(
                                                                  '#406497'),
                                                          onPressed: () {},
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                      Container(
                                                        height: 20,
                                                        width: 30,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            border: Border.all(
                                                                color: HexColor(
                                                                    '#707070'))),
                                                        child: Center(
                                                          child: Text(
                                                            '3',
                                                            style: GoogleFonts.lato(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    defaultColor),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 13,
                                                ),
                                                Text(
                                                  'الكمية',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),

                                            // Container(
                                            //   height: 1,
                                            //   // width: 300,
                                            //   clipBehavior: Clip.antiAlias,
                                            //   decoration: BoxDecoration(
                                            //     color: Colors.black,
                                            //   ),
                                            // ),
                                            Divider(
                                              thickness: 1,
                                              height: 1,
                                              color: Colors.black,
                                            ),

                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'جنيه',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '150,9',
                                                  style: GoogleFonts.lato(
                                                      fontSize: 21,
                                                      color:
                                                          HexColor('#F99100'),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          ]),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.black,
                                            height: 100,
                                            width: 100,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                      itemCount: 2),
                ),
              ],
            ),
            // Center(
            //   child: Text(
            //     "Add products",
            //     style: TextStyle(fontSize: 20),
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
