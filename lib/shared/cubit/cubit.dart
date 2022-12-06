// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shop/models/categoryModel.dart';
import 'package:shop/models/favoritesmodel.dart';
import 'package:shop/models/homemodel.dart';
import 'package:shop/models/notificationmodel.dart';
import 'package:shop/models/profilemodel.dart';
import 'package:shop/modules/homelayoutscreens/addproduct/addproduct.dart';
import 'package:shop/modules/homelayoutscreens/favourites/favoritesscreen.dart';
import 'package:shop/modules/homelayoutscreens/home/homeScreen.dart';
import 'package:shop/modules/search_screen/search_screen.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/components/constant.dart';
import 'package:shop/shared/cubit/states.dart';
import 'package:shop/shared/network/remote/end_points.dart';
import 'package:shop/shared/style/colors.dart';

import '../../models/productdetailsmodel.dart';
import '../../modules/homelayoutscreens/notification/notificationscreen.dart';
import '../../modules/homelayoutscreens/profile/profilescreen.dart';
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

  List<Widget> buildScreens() {
    return [
      ProfileScreen(),
      NotificationScreen(),
      AddProductScreen(),
      FavoritesScreen(),
      HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
        ),
        iconSize: 30,
        title: ("الحساب"),
        activeColorPrimary: HexColor("#1E55A2"),
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.notifications,
        ),
        iconSize: 30,
        title: ("الاشعارات"),
        activeColorPrimary: HexColor("#1E55A2"),
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: CircleAvatar(
          radius: 70,
          backgroundColor: Colors.grey[300],
          child: Icon(
            Icons.camera_alt,
            size: 30,
            color: HexColor("#F99100"),
          ),
        ),
        iconSize: 80,
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.favorite_outlined,
        ),
        iconSize: 30,
        title: ("المفضلة"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
        ),
        iconSize: 30,
        title: ("الرئيسية"),
        activeColorPrimary: HexColor("#1E55A2"),
        inactiveColorPrimary: Colors.black,
      ),
    ];
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 4);

  // void bottomNav(int index) {
  //   currentIndex = index;
  //   emit(AppBottomNavBarState());
  // }
  //
  // Widget navigatBar() => BottomNavigationBar(
  //       onTap: (index) {
  //         bottomNav(index);
  //       },
  //       currentIndex: currentIndex,
  //       type: BottomNavigationBarType.fixed,
  //       selectedItemColor: HexColor("#1E55A2"),
  //       unselectedItemColor: Colors.black,
  //       unselectedLabelStyle: TextStyle(
  //         fontWeight: FontWeight.bold,
  //         fontSize: 12,
  //       ),
  //       selectedLabelStyle: TextStyle(
  //         fontWeight: FontWeight.bold,
  //         fontSize: 16,
  //       ),
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             Icons.person,
  //             size: 30,
  //           ),
  //           label: "الحساب",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             Icons.notifications,
  //             size: 30,
  //           ),
  //           label: "الاشعارات",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             Icons.favorite_outlined,
  //             size: 30,
  //           ),
  //           label: "المفضلة",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             Icons.home,
  //             size: 30,
  //           ),
  //           label: "الرئيسية",
  //         ),
  //       ],
  //     );

  Widget cartsIcon() => CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: IconButton(
          iconSize: 20,
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            size: 20,
            color: HexColor("#F99100"),
          ),
        ),
      );

  Widget cartIconAdd() => InkWell(
        onTap: () {},
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: defaultcolor,
              radius: 17,
              child: Icon(
                Icons.shopping_cart_sharp,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: HexColor("#F99100"),
                  radius: 8,
                  child: Icon(
                    Icons.add,
                    size: 8,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      );
  var searchController = TextEditingController();

  Widget normalAppBar(
    BuildContext context, {
    double height = 150,
    double opacity = 1,
    required bool? showSearch,
    Widget? expectSearch,
    required bool? addChild,
    Widget? child,
  }) =>
      appBarShape(
        opacity: opacity,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 45),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cartsIcon(),
                  SizedBox(
                    width: 10,
                  ),
                  showSearch == !false
                      ? Expanded(
                          child: SizedBox(
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
                        )
                      : expectSearch!
                ],
              ),
              SizedBox(
                height: 10,
              ),
              addChild == !false
                  ? child!
                  : SizedBox(
                      height: 0,
                      width: 0,
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
    emit(ChangeFavStateState());
  }

  int carouselHomeCurrent = 0;
  void carouselIndexChange(int index) {
    carouselHomeCurrent = index;
    emit(CarouselHomeCurrentState());
  }

  int carouselProductCurrent = 0;
  void carouselProductIndexChange(int index) {
    carouselProductCurrent = index;
    emit(CarouselProductCurrentState());
  }

  //Get Data
  List? sort;

  // void sorted() {
  //   for (int i = 0; i < homeModel!.data.products.length; i++) {
  //     if (homeModel!.data.products[i].discount == 0) {
  //       // var a = homeModel!.data.products[i].discount = 0;
  //       // sort!.add(new ProductModel.);
  //     }
  //   }
  // for (int i = 0; i < homeModel!.data.products.length; i++) {
  // if (homeModel!.data.products[i].discount == 0) {
  // var a = homeModel!.data.products[i].discount = 0;
  // sort!.add(homeModel!.data.products[i]);
  // print('0');
  // }
  //
  // }

  HomeModel? homeModel;
  void getHomeData() {
    // print("homeDataModel?.status");
    emit(HomeGetDataLoading());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) async {
      homeModel = HomeModel.fromJson(value.data);

      if (kDebugMode) {
        print(homeModel?.data.banners[1].image);
      }

      emit(HomeGetDataSuccess());
    }).catchError((error) {
      emit(HomeGetDataError(error));
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoryData() {
    // print("categeoryModel?.status");
    emit(CategoryDataLoading());

    DioHelper.getData(
      url: CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(CategoryDataSuccess());
    }).catchError((error) {
      emit(CategoryDataError(error));
    });
  }

  //User Data
  ProfileModel? profileModel;
  void getUserData() {
    emit(UserDataLoading());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);

      emit(UserDataSuccess());
    }).catchError((error) {
      emit(UserDataError(error));
    });
  }

  NotificationModel? notificationModel;
  void getNotificationData() {
    emit(NotificationDataLoading());

    DioHelper.getData(
      url: NOTIFICATIONS,
      token: token,
    ).then((value) {
      notificationModel = NotificationModel.fromJson(value.data);
      if (kDebugMode) {
        print(notificationModel!.data!.lastPage);
        // print(notificationModel!.status);
      }
      emit(NotificationDataSuccess());
    }).catchError((error) {
      emit(NotificationDataError(error));
    });
  }

  FavoritesModel? favoritesModel;
  void getFavoritesData() {
    emit(FavoritesDataLoading());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      if (kDebugMode) {
        print('fave ${favoritesModel!.data!.data![1].product!.name!}');
        // print(notificationModel!.status);
      }
      emit(FavoritesDataSuccess());
    }).catchError((error) {
      emit(FavoritesDataError(error));
    });
  }

  ProductDetailsModel? productDetailsModel;
  void getProductDataById(int? id) {
    // print("homeDataModel?.status");
    emit(ProductGetDataLoading());

    DioHelper.getData(
      url: '$PRODUCt${id!.toString()} ',
      token: token,
    ).then((value) async {
      productDetailsModel = ProductDetailsModel.fromJson(value.data);

      if (kDebugMode) {
        print(productDetailsModel!.data!.name);
      }

      emit(ProductGetDataSuccess());
    }).catchError((error) {
      emit(ProductGetDataError(error));
    });
  }
}
