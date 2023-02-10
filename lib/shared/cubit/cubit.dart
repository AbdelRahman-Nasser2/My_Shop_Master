// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shop/models/CategoryProductsModel.dart';
import 'package:shop/models/cartsModel.dart';
import 'package:shop/models/categoryModel.dart';
import 'package:shop/models/changefavorites.dart';
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

  Widget cartsIcon(context) => InkWell(
    onTap: (){
      getCartsData();
      showDialog(
          useRootNavigator: false,
          context: context,
          builder: (context)=>Center(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 5)
                  ],
                ),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemBuilder: (context, index) =>Container(
                      height: 20,
                   ),
                    separatorBuilder: (context, index) => SizedBox(
                     height: 5,
                    ),
                    itemCount: cartsDataModel!.data!.cartItems!.length),
      ),
            ),
          ));
    },
    child: CircleAvatar(
      radius: 25,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 25,
                    color: HexColor("#F99100"),
                  ),
                ),
          ),
          (cartsDataModel!.data!.cartItems!.isNotEmpty)?
          Positioned.directional(
            textDirection: TextDirection.rtl,
            // start: 20,
            end: 28,
            // top: 2,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(cartsDataModel!.data!.cartItems!.length.toString()),
            ),
          )
              :SizedBox(
            height: 0,
            width: 0,
          )
        ],
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
     context, {
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
                  cartsIcon(context),
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
  bool favt=true;
  void iconChange() {
favt=!favt;
fav=favt?Colors.red:Colors.white;
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


  Map<int,bool> favorites={};

  HomeModel? homeModel;
  void getHomeData() {
    // print("homeDataModel?.status");
    emit(HomeGetDataLoading());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) async {
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data.products.forEach((element)
      {
        favorites.addAll({
          element.id:element.inFavorites});
      });

      emit(HomeGetDataSuccess());
    }).catchError((error) {
      emit(HomeGetDataError(error));
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoryData() {
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

  CategoryProductsModel? categoryProductsModel;
  void getCategoryProductsById(int? id) {
    emit(CategoryProductsGetDataLoading());

    DioHelper.getData(
      url: '$CATEGORYPRODUCTS$id',
      token: token,
    ).then((value) async {
      categoryProductsModel = CategoryProductsModel.fromJson(value.data);
      categoryProductsModel?.data!.data!.forEach((element)
      {
        favorites.addAll({
          element.id!:element.inFavorites!});
      });

      emit(CategoryProductsGetDataSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(CategoryProductsGetDataError(error));
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
print(profileModel?.data!.phone);
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
      // favoritesModel?.data!.data!.forEach((element)
      // {
      //   favorites.addAll({
      //     element.id!:element.inFavorites!});
      // });
      // if (kDebugMode) {
      //   print('fave ${favoritesModel!.data!.data![1].product!.id}');
      //   print(favoritesModel!.data!.data![1].id);
      // }
      emit(FavoritesDataSuccess());
    }).catchError((error) {
      print(error);
      emit(FavoritesDataError(error));
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void addOrDeleteFavorites({
    required int id,
  }) {
    emit(ChangeFavoritesSuccess());
    favorites[id] = !favorites[id]!;
    DioHelper.postsData(
        url: FAVORITES,
        token: token,
        data: {
      'product_id': id,
    }).then((value) {
      changeFavoritesModel=ChangeFavoritesModel.fromJson(value.data);
      if(!changeFavoritesModel!.status!){
        favorites[id] = !favorites[id]!;

      }else{
        getFavoritesData();
      }

      emit(AddOrDeleteFavoritesSuccess(changeFavoritesModel));
    }).catchError((error) {
      favorites[id] = !favorites[id]!;

      emit(AddOrDeleteFavoritesError(error.toString()));
    });
  }


  CartsDataModel? cartsDataModel;
  void getCartsData() {
    emit(CartsDataLoading());

    DioHelper.getData(
      url: CARTS,
      token: token,
    ).then((value) {
      cartsDataModel = CartsDataModel.fromJson(value.data);

      // favoritesModel?.data!.data!.forEach((element)
      // {
      //   favorites.addAll({
      //     element.id!:element.inFavorites!});
      // });
      // if (kDebugMode) {
      //   print(cartsDataModel!.status);
      //   print(cartsDataModel!.data!.cartItems![1].product!.name);
      // }
      emit(CartsDataSuccess());
    }).catchError((error) {
      print(error);

      emit(CartsDataError(error));
    });
  }


  ProductDetailsModel? productDetailsModel;
  void getProductDataById(int? id,context) {
    emit(ProductGetDataLoading());

    DioHelper.getData(
      url: '$PRODUCt${id!.toString()} ',
      token: token,
    ).then((value) async {
      productDetailsModel = ProductDetailsModel.fromJson(value.data);
// navigateTo(context, ProductDetails(id));
      // if (kDebugMode) {
      //   print(productDetailsModel!.data!.name);
      // }

      emit(ProductGetDataSuccess());
    }).catchError((error) {
      emit(ProductGetDataError(error));
    });
  }


}
