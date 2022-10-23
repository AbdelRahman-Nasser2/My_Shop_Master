// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/layout/category/maincategeory.dart';
import 'package:shop/models/categeory_models.dart';
import 'package:shop/modules/category/modelCategoryScreen.dart';
import 'package:shop/shared/components/constant.dart';
import 'package:shop/shared/network/local/sharedpreference/sharedpreference.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates states) {},
        builder: (BuildContext context, AppStates states) {
          AppCubit cubit = AppCubit.get(context);
          var pageViewController = PageController(initialPage: 0,keepPage: false);

          List<Widget> homeOffers = [
            Image.asset(
              "assets/images/Rectangle 1468.png",
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            Image.asset(
              "assets/images/Facebook logo.png",
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            Image.asset(
              "assets/images/Google logo.png",
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            Image.asset(
              "assets/images/Twitter logo.png",
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            Image.asset(
              "assets/images/Rectangle 1468.png",
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ];

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
                      child: Container(
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
                      child: Container(
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
                      child: Container(
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
                      child: Container(
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
                      child: Container(
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
                      child: Container(
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
              preferredSize: Size.fromHeight(200),
              child: Stack(
                children: [
                  cubit.NormalAppBar(context),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 120, right: 20, left: 20, bottom: 10),
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      blurStyle: BlurStyle.outer
                                      // changes position of shadow
                                      ),
                                ],
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            child: PageView(
                              controller: pageViewController,
                              allowImplicitScrolling: true,
                              reverse: true,
                              pageSnapping: false,
                              physics: physics,
                              // itemCount: ,
                              // itemBuilder: (BuildContext context, int index) {return Image.network("src");  },
                              children: homeOffers,
                            ),
                          ),

                          //Smooth
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 70, right: 20, left: 20, bottom: 10),
                              child: Container(
                                height: 18,
                                decoration: BoxDecoration(
                                    color: HexColor("#1E55A2").withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(25)),
                                child: SmoothPageIndicator(

                                  controller: pageViewController,
                                  count: homeOffers.length,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) {
                                    pageViewController.animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  effect: ScrollingDotsEffect(
                                    activeStrokeWidth: 1.5,
                                    activeDotScale: 1.3,
                                    maxVisibleDots: 5,
                                    fixedCenter: false,
                                    offset: 16.0,
                                    dotWidth: 10,
                                    dotHeight: 10,
                                    spacing: 8.0,
                                    radius: 16,
                                    dotColor: Colors.white.withOpacity(0.3),
                                    activeDotColor: Colors.white,
                                    strokeWidth: 1.0,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    buildHomeCategoryList(
                      axis: Axis.horizontal,
                      allShow_OnTap: () {
                        navigateTo(context, MainCategoryScreen());
                      },
                      type: 'التصنيفات',
                      list: mainCategory,
                      listCount: 3,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    buildHomeProductList(
                        type: 'أفضل العروض',
                        list: CategeoryItemsList,
                        allshow_ontap: () {
                          CacheHelper.removeData(key: "token");
                          // CacheHelper.removeAllData();
                          // CacheHelper.removeData(key: "onBoarding");
                          // CacheHelper.removeData(key: "start");
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    buildHomeProductList(
                        type: 'الأكثر مبيعاً  ',
                        list: CategeoryItemsList,
                        allshow_ontap: () {}),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//     appBar: PreferredSize(
//   preferredSize: Size.zero,
//   child: Stack(
//     children: [
//       AppBar(
//         systemOverlayStyle: SystemUiOverlayStyle(
//             systemNavigationBarColor: Colors.black,
//             statusBarColor: HexColor("#1E55A2"),
//             statusBarIconBrightness: Brightness.dark,
//             statusBarBrightness: Brightness.dark),
//         backgroundColor: HexColor("#1E55A2"),
//         toolbarHeight: 100,
//         shape: UnderlineInputBorder(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(40),
//               bottomRight: Radius.circular(40),
//             ),
//             borderSide: BorderSide(width: 0, color: HexColor("#1E55A2"))),
//         shadowColor: HexColor('#1E55A2'),
//         title: Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//           ),
//           child: IconButton(
//             iconSize: 38,
//             onPressed: () {},
//             icon: Icon(
//               Icons.shopping_cart,
//               color: HexColor("#F99100"),
//             ),
//           ),
//         ),
//         automaticallyImplyLeading: false,
//
//         // leading: Container(
//         //   decoration: BoxDecoration(
//         //     shape: BoxShape.circle,
//         //     color: Colors.white,
//         //   ),
//         //   child: IconButton(
//         //     iconSize: 38,
//         //     onPressed: () {},
//         //     icon: Icon(
//         //       Icons.shopping_cart,
//         //       color: HexColor("#F99100"),
//         //     ),
//         //   ),
//         // ),
//         elevation: 10,
//       ),
//       Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//       )
//     ],
//   ),
// ),

// Container(
// // height: 100,
// // width: 100,
// decoration: BoxDecoration(
// boxShadow: [
// BoxShadow(
// color: Colors.grey,
// blurStyle: BlurStyle.inner,
// offset: Offset.fromDirection(2, 2),
// blurRadius: 0),
// ],
// image: DecorationImage(
// fit: BoxFit.cover,
// image: AssetImage("assets/images/clothes_cat.png"),
// ),
// ),
// // child: Image.asset("assets/images/Group 8534.png"),
// ),
// Container(
// height: 100,
// width: 100,
// decoration: BoxDecoration(
// image: DecorationImage(
// fit: BoxFit.cover,
// image: AssetImage("assets/images/clothes_cat.png"),
// ),
// ),
// child: Stack(
// fit: StackFit.loose,
// children: [
// Image.asset(
// fit: BoxFit.cover,
// ),
// Align(
// alignment: AlignmentDirectional.center,
// child: Padding(
// padding: EdgeInsets.only(top: 30),
// child: Text("ملابس"),
// ),
// ),
// ],
// ),
// ),
