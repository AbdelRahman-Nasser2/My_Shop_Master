// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/models/categeory_models.dart';
import 'package:shop/modules/category/modelCategoryScreen.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';

class MainCategoryScreen extends StatelessWidget {
  const MainCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates states) {},
        builder: (BuildContext context, AppStates states) {
          AppCubit cubit = AppCubit.get(context);

          List<CategeoryModel> mainCategory = [
            CategeoryModel("assets/images/categeory/clothes.png", "ملابس", () {
              navigateTo(
                  context,
                  ModleCateegoryScreen(
                    title: "ملابس",
                    image: "images/categeory/clo.png",
                    children: [
                      InkWell(
                        onTap: () {
                          navigateTo(context, null);
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/clo1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/clo2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/clo3.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/clo4.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/clo5.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/clo6.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/clo7.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/clo8.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ));
            }),
            CategeoryModel(
                "assets/images/categeory/electeric.png", "الكترونيات", () {
              navigateTo(
                  context,
                  ModleCateegoryScreen(
                    title: "الكترونيات",
                    image: "images/categeory/elec.png",
                    children: [
                      InkWell(
                        onTap: () {
                          navigateTo(context, null);
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/elec1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/elec2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/elec3.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/elec4.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/elec5.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/elec6.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/elec7.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 500,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            "images/categeory/elec8.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ));
            }),
            CategeoryModel(
                "assets/images/categeory/beuty_tooles.png", "مستحضرات التجميل",
                () {
              navigateTo(
                context,
                ModleCateegoryScreen(
                  title: "مستحضرات التجميل",
                  image: "images/categeory/beu.png",
                  children: [
                    InkWell(
                      onTap: () {
                        navigateTo(context, null);
                      },
                      child: SizedBox(
                        height: 500,
                        width: 300,
                        child: Image.asset(
                          "images/categeory/beu1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 500,
                        width: 150,
                        child: Image.asset(
                          "images/categeory/beu2.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 500,
                        width: 150,
                        child: Image.asset(
                          "images/categeory/beu3.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 500,
                        width: 300,
                        child: Image.asset(
                          "images/categeory/beu4.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 500,
                        width: 150,
                        child: Image.asset(
                          "images/categeory/beu5.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 500,
                        width: 150,
                        child: Image.asset(
                          "images/categeory/beu6.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            CategeoryModel(
                "assets/images/categeory/sports_tools.png", "الأدوات الرياضية",
                () {
              navigateTo(
                  context,
                  ModleCateegoryScreen(
                      title: "الأدوات الرياضية",
                      image: "images/categeory/sp.png",
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              "images/categeory/sp3.png",
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/sp1.png"),
                          ),
                        ),
                        SizedBox(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/sp2.png"),
                          ),
                        ),
                      ]));
            }),
            CategeoryModel(
                "assets/images/categeory/accessories.png", "الإكسسوارات", () {
              navigateTo(
                  context,
                  ModleCateegoryScreen(
                      title: "الإكسسوارات",
                      image: "images/categeory/accessories.png",
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              "images/categeory/acc1.png",
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/acc2.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/acc3.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/acc4.png"),
                          ),
                        ),
                      ]));
            }),
            CategeoryModel("assets/images/categeory/kitchen.png", "المطبخ", () {
              navigateTo(
                  context,
                  ModleCateegoryScreen(
                      title: "المطبخ",
                      image: "images/categeory/kit.png",
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              "images/categeory/kit1.png",
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/kit2.png"),
                          ),
                        ),
                        SizedBox(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/kit3.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/kit4.png"),
                          ),
                        ),
                      ]));
            }),
            CategeoryModel("assets/images/categeory/phones.png", "موبايلات",
                () {
              navigateTo(
                  context,
                  ModleCateegoryScreen(
                      title: "موبايلات",
                      image: "images/categeory/phones.png",
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              fit: BoxFit.cover,
                              "images/categeory/ph1.png",
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                                fit: BoxFit.cover, "images/categeory/ph2.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              fit: BoxFit.cover,
                              "images/categeory/ph3.png",
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                                fit: BoxFit.cover, "images/categeory/ph4.png"),
                          ),
                        ),
                      ]));
            }),
            CategeoryModel("assets/images/categeory/tv.png", "تلفيزيونات", () {
              navigateTo(
                  context,
                  ModleCateegoryScreen(
                      title: "تلفيزيونات",
                      image: "images/categeory/tv.png",
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              "images/categeory/ph1.png",
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/ph2.png"),
                          ),
                        ),
                        SizedBox(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/ph3.png"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 500,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset("images/categeory/ph4.png"),
                          ),
                        ),
                      ]));
            }),
          ];

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: cubit.NormalAppBar(
                context,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        itemBuilder: (context, index) => categoryItem(
                            mainCategory[index],
                            fontTittleSize: 20,
                            height: 180),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 30,
                            ),
                        itemCount: mainCategory.length),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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
