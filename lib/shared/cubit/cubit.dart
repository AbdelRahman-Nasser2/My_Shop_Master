// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/modules/homelayoutscreens/favourites/favourits.dart';
import 'package:shop/modules/homelayoutscreens/home/homeScreen.dart';
import 'package:shop/modules/search_screen/search_screen.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/cubit/states.dart';

import '../../modules/homelayoutscreens/notification/notification.dart';
import '../../modules/homelayoutscreens/profile/profile.dart';
import '../network/remote/dio_Helper/dio_Helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  // bool aa = ThemeCubit.get(context).isDark;

//part of AnimatedBottomNavigationBar
  var pageViewController = PageController(initialPage: 0);
  int currentIndex = 3;
  // var bottomNavIndex = 2;
  // final controller = ScrollController();
  //
  // late Animation<double> animation;
  //
  // late CurvedAnimation curve;
  // var navigation = GlobalKey();
  //
  // final iconList = <IconData>[
  //   Icons.menu_outlined,
  //   Icons.search_rounded,
  //   Icons.notifications,
  //   Icons.person_outline,
  // ];

  List<Widget> screens = [
    profileScreen(),
    notificationScreen(),
    FavouritsScreen(),
    HomeScreen(),
  ];

  void bottomNav(int index) {
    currentIndex = index;
    emit(AppBottomNavBarState());
  }

  Widget navigatBar() => BottomNavigationBar(
        onTap: (index) {
          bottomNav(index);
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: HexColor("#1E55A2"),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: "الحساب",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
            label: "الاشعارات",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outlined,
              size: 30,
            ),
            label: "المفضلة",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "الرئيسية",
          ),
        ],
      );
  var searchController = TextEditingController();

  Widget NormalAppBar(BuildContext context,
          {double height = 150, double opacity = 1}) =>
      AppBarShape(
        opacity: opacity,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShoppingCart(),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 40,
                  child: searchBar(
                    onTap: () {
                      navigateTo(context, SearchScreen());
                    },
                    controller: searchController,
                    input: TextInputType.text,
                    hint: "أبحث عن المنتج الذي تريدة",
                    prifix: Icon(
                      Icons.filter_list_alt,
                      color: HexColor("#D8D8D8"),
                    ),
                    prifixpressed: () {},
                    suffix: Icon(
                      Icons.search,
                      color: HexColor("#1E55A2"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Row(
        //   children: [
        //     IconButton(
        //       iconSize: 38,
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.shopping_cart,
        //         color: HexColor("#F99100"),
        //       ),
        //     ),
        //
        //   ],
        // ),
      );

  Color? fav;
  void iconChange() {
    fav = Colors.red;
    emit(ChangeFavState());
  }

  //Theme Mode
  bool isDark = true;
  // void themeChange() {
  //   isDark = !isDark;
  //   emit(AppChangeThemeState());
  // }
  void themeChange({String? mode}) {}

//  Parts of APIs
  List<dynamic> total = [];

  // part Sports
  List<dynamic> sports = [];

  void getDataSports() {
    emit(AppGetArticlesSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'Sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {
        // print(value.data["articles"][0]["title"]);
        sports = value.data["articles"];
        total = value.data["articles"];
        // print(articles[1]["title"]);
        emit(AppGetArticlesSportsState());
      }).catchError((error) {
        print(error.toString());
        emit(AppGetArticlesSportsErrorState(error));
      });
    } else {
      emit(AppGetArticlesSportsState());
    }
  }

  // part Business
  List<dynamic> business = [];
  //https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=65f7f556ec76449fa7dc7c0069f040ca
  void getDataBusiness() {
    emit(AppGetArticlesBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'Business',
        'apiKey': 'ee564a6a28654d1f967de3e14d78921f',
      }).then((value) {
        // print(value.data["articles"][0]["title"]);
        business = value.data["articles"];
        total = value.data["articles"];

        // print(articles[1]["title"]);
        emit(AppGetArticlesBusinessState());
      }).catchError((error) {
        print(error.toString());
        emit(AppGetArticlesBusinessErrorState(error));
      });
    } else {
      emit(AppGetArticlesBusinessState());
    }
  }

  // part Science
  List<dynamic> science = [];

  void getDataScience() {
    emit(AppGetArticlesScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'Science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {
        // print(value.data["articles"][0]["title"]);
        science = value.data["articles"];
        // print(articles[1]["title"]);
        emit(AppGetArticlesScienceState());
      }).catchError((error) {
        print(error.toString());
        emit(AppGetArticlesScienceErrorState(error));
      });
    } else {
      emit(AppGetArticlesScienceState());
    }
  }

  //part Search
  List<dynamic> search = [];
  void getDataSearch(String value) {
    emit(AppGetSearchLoadingState());
    // addproduct = [];
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      print(value.data["articles"][0]["title"]);
      search = value.data["articles"];
      // total = articles;
      // print(articles[1]["title"]);
      emit(AppGetSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetArticlesErrorState(error));
    });
  }

  List<dynamic> articles = [];
  void getData() {
    emit(AppGetArticlesLoadingState());
    // sources=techcrunch&apiKey=ee564a6a28654d1f967de3e14d78921f
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'sources': 'techcrunch',
      'apiKey': 'ee564a6a28654d1f967de3e14d78921f',
    }).then((value) {
      print(value.data["articles"][0]["title"]);
      articles = value.data["articles"];
      total = value.data["articles"];
      // print(articles[1]["title"]);
      emit(AppGetArticlesState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetArticlesErrorState(error));
    });
  }

  //Part US Business
  List<dynamic> usBusiness = [];

  //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ee564a6a28654d1f967de3e14d78921f
  void getDataUSBusiness() {
    emit(AppGetArticlesUSBusinessLoadingState());
    if (usBusiness.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'ee564a6a28654d1f967de3e14d78921f',
      }).then((value) {
        // print(value.data["articles"][0]["title"]);
        usBusiness = value.data["articles"];
        // total = business;

        // print(articles[1]["title"]);
        emit(AppGetArticlesUSBusinessState());
      }).catchError((error) {
        print(error.toString());
        emit(AppGetArticlesUSBusinessErrorState(error));
      });
    } else {
      emit(AppGetArticlesUSBusinessState());
    }
  }
}
