// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shop/models/CategoryProductsModel.dart';
import 'package:shop/models/cartsModel.dart';
import 'package:shop/models/categoryModel.dart';
import 'package:shop/models/changeCartsModel.dart';
import 'package:shop/models/changefavorites.dart';
import 'package:shop/models/favoritesmodel.dart';
import 'package:shop/models/homemodel.dart';
import 'package:shop/models/notificationmodel.dart';
import 'package:shop/models/profilemodel.dart';
import 'package:shop/modules/completeShopping/completeShopping.dart';
import 'package:shop/modules/homelayoutscreens/addproduct/addproduct.dart';
import 'package:shop/modules/homelayoutscreens/favourites/favoritesscreen.dart';
import 'package:shop/modules/homelayoutscreens/home/homeScreen.dart';
import 'package:shop/modules/productdetails/productdetails.dart';
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
  static Widget? widget;
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

  Widget cartsIcon(cartContext) => InkWell(
        onTap: () {
          getCartsData();
          showDialog(
              useRootNavigator: false,
              context: cartContext,
              builder: (context) => Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Container(
                      padding: EdgeInsetsDirectional.only(bottom: 35),
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
                      child: Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsetsDirectional.only(
                          //       start: 25, end: 25, top: 10, bottom: 8),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       GestureDetector(
                          //         onTap: () {
                          //           Navigator.pop(context);
                          //         },
                          //         child: Icon(
                          //           Icons.close,
                          //           size: 30,
                          //           color: HexColor('#1B2538'),
                          //         ),
                          //       ),
                          //       Text(
                          //         'السلة',
                          //         style: GoogleFonts.lato(
                          //             fontSize: 20,
                          //             fontWeight: FontWeight.bold,
                          //             color: Colors.black),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 10),
                            child: Divider(
                              thickness: 2,
                              height: 14,
                              color: HexColor('#D7DDE1'),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                primary: true,
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 25,
                                          end: 25,
                                          top: 10,
                                          bottom: 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.close,
                                              size: 30,
                                              color: HexColor('#1B2538'),
                                            ),
                                          ),
                                          Text(
                                            'السلة',
                                            style: GoogleFonts.lato(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                  if (index ==
                                      cartsDataModel!.data!.cartItems!.length +
                                          1) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Divider(
                                            thickness: 2,
                                            height: 14,
                                            color: HexColor('#D7DDE1'),
                                          ),
                                        ),
                                        Text(
                                          'إجمالي السعر',
                                          style: GoogleFonts.lato(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold,
                                              color: defaultColor),
                                        ),
                                        Text(
                                          cartsDataModel!.data!.total
                                              .toString(),
                                          style: GoogleFonts.lato(
                                              fontSize: 34,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            navigateTo(
                                                context, CompleteShopping());
                                          },
                                          child: Container(
                                            width: 200,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: HexColor("#F99100"),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                              child: Text(
                                                'متابعة عملية الشراء',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return cartItem(index - 1, cartContext);
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 5,
                                    ),
                                itemCount:
                                    cartsDataModel!.data!.cartItems!.length +
                                        2),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 5),
                          //   child: Divider(
                          //     thickness: 2,
                          //     height: 14,
                          //     color: HexColor('#D7DDE1'),
                          //   ),
                          // ),
                          // Text(
                          //   'إجمالي السعر',
                          //   style: GoogleFonts.lato(
                          //       fontSize: 26,
                          //       fontWeight: FontWeight.bold,
                          //       color: defaultColor),
                          // ),
                          // Text(
                          //   cartsDataModel!.data!.total.toString(),
                          //   style: GoogleFonts.lato(
                          //       fontSize: 34,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.black),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: Container(
                          //     width: 200,
                          //     height: 40,
                          //     decoration: BoxDecoration(
                          //         color: HexColor("#F99100"),
                          //         borderRadius: BorderRadius.circular(20)),
                          //     child: Center(
                          //       child: Text(
                          //         'متابعة عملية الشراء',
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 18,
                          //           color: Colors.white,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
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
              (cartsDataModel!.data!.cartItems!.isNotEmpty)
                  ? Positioned.directional(
                      textDirection: TextDirection.rtl,
                      // start: 20,
                      end: 28,
                      // top: 2,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                            cartsDataModel!.data!.cartItems!.length.toString()),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    )
            ],
          ),
        ),
      );

  Widget cartItem(
    int index,
    context,
  ) =>
      GestureDetector(
        onTap: () {
          getProductDataById(
              cartsDataModel!.data!.cartItems![index].product!.id!, context);
          navigateTo(
              context,
              ProductDetails(
                cartsDataModel!.data!.cartItems![index].product!.id!,
              ));
        },
        child: Card(
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: HexColor('#000000'),
          color: Colors.white,
          borderOnForeground: true,
          elevation: 20,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 9, left: 9, right: 14, bottom: 18),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    deleteCartItem(
                      id: cartsDataModel!.data!.cartItems![index].id!,
                    );
                    carts[
                        cartsDataModel!
                            .data!.cartItems![index].product!.id!] = !carts[
                        cartsDataModel!.data!.cartItems![index].product!.id!]!;
                  },
                  icon: Icon(
                    Icons.close,
                    color: HexColor('#1B2538'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Name of product item
                        Text(
                          cartsDataModel!
                              .data!.cartItems![index].product!.name!,
                          maxLines: 1,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'جنيه',
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              cartsDataModel!
                                  .data!.cartItems![index].product!.oldPrice
                                  .toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
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

                        //  Quantity
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
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
                                      radius: 10,
                                      child: FloatingActionButton(
                                        clipBehavior: Clip.antiAlias,
                                        mini: true,
                                        backgroundColor: defaultColor,
                                        onPressed: () {
                                          updateItemCarts(
                                              id: cartsDataModel!
                                                  .data!.cartItems![index].id!,
                                              quantity: cartsDataModel!
                                                      .data!
                                                      .cartItems![index]
                                                      .quantity! +
                                                  1);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    CircleAvatar(
                                      radius: 10,
                                      child: FloatingActionButton(
                                        clipBehavior: Clip.antiAlias,
                                        mini: true,
                                        backgroundColor: HexColor('#406497'),
                                        onPressed: () {
                                          updateItemCarts(
                                              id: cartsDataModel!
                                                  .data!.cartItems![index].id!,
                                              quantity: (cartsDataModel!
                                                          .data!
                                                          .cartItems![index]
                                                          .quantity ==
                                                      1)
                                                  ? cartsDataModel!
                                                      .data!
                                                      .cartItems![index]
                                                      .quantity!
                                                  : cartsDataModel!
                                                          .data!
                                                          .cartItems![index]
                                                          .quantity! -
                                                      1);
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 20,
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
                                        child:

                                            // TextFormField(
                                            //   // controller: ,
                                            //   initialValue: cartsDataModel!
                                            //       .data!.cartItems![index].quantity!
                                            //       .toString(),
                                            //   style: GoogleFonts.lato(
                                            //       fontSize: 13,
                                            //       fontWeight: FontWeight.bold,
                                            //       color: defaultColor),
                                            //   textAlign: TextAlign.center,
                                            //   buildCounter: counter,
                                            // ),

                                            Text(
                                          cartsDataModel!
                                              .data!.cartItems![index].quantity!
                                              .toString(),
                                          style: GoogleFonts.lato(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: defaultColor),
                                          semanticsLabel: cartsDataModel!
                                              .data!.cartItems![index].quantity!
                                              .toString(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'الكمية',
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Divider(
                          thickness: 1,
                          height: 14,
                          color: HexColor('#D7DDE1'),
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              ' ${cartsDataModel!.data!.cartItems![index].product!.price! * cartsDataModel!.data!.cartItems![index].quantity}',
                              style: GoogleFonts.lato(
                                  fontSize: 21,
                                  color: HexColor('#F99100'),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ]),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          height: 100,
                          fit: BoxFit.cover,
                          cartsDataModel!
                              .data!.cartItems![index].product!.image!,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: (cartsDataModel!.data!.cartItems![index]
                                      .product!.discount ==
                                  0)
                              ? false
                              : true,
                          child: Text(
                            '${cartsDataModel!.data!.cartItems![index].product!.discount!.toString()} % خصم ',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      );

  Widget cartIconAdd(int? id) => InkWell(
        onTap: () {
          addOrDeleteCarts(id: id!);
        },
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: defaultColor,
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

  Map<int, bool> carts = {};
  Map<int, int> carts2 = {};

  CartsDataModel? cartsDataModel;
  void getCartsData() {
    emit(CartsDataLoading());

    DioHelper.getData(
      url: CARTS,
      token: token,
    ).then((value) {
      cartsDataModel = CartsDataModel.fromJson(value.data);
      cartsDataModel?.data!.cartItems!.forEach((element) {
        // carts.addAll({element.id!: element.product!.inCart!});
        carts2.addAll({element.product!.id!: element.id!});
      });
      // print(carts2);
      // print(carts);
      // // if (kDebugMode)
      // print(cartsDataModel!.status);
      // print(cartsDataModel!.data!.cartItems![1].product!.name);
      // }
      emit(CartsDataSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }

      emit(CartsDataError(error));
    });
  }

  ChangeCartsModel? changeCartsModel;

  void deleteCartItem({
    required int id,
  }) {
    emit(DeleteCartsItemLoading());
    // carts[id] = !carts[id]!;

    DioHelper.deleteData(
      url: '$CARTS/ ${id.toString()}',
      token: token,
    ).then((value) {
      changeCartsModel = ChangeCartsModel.fromJson(value.data);
      // getCartsData();
      // carts[id] = !carts[id]!;
      // print(carts);
      if (!changeCartsModel!.status!) {
        carts[id] = !carts[id]!;
      } else {
        getCartsData();
      }
      // print(changeCartsModel!.message);

      emit(DeleteCartsItemSuccess(changeCartsModel));
    }).catchError((error) {
      carts[id] = !carts[id]!;

      emit(DeleteCartsItemError(error.toString()));
    });
  }

  ChangeCartsModel? addOrDeleteCartsItem;

  void addOrDeleteCarts({
    required int id,
  }) {
    emit(AddOrDeleteCartsItemLoading());
    carts[id] = !carts[id]!;
    DioHelper.postsData(url: CARTS, token: token, data: {
      'product_id': id,
    }).then((value) {
      addOrDeleteCartsItem = ChangeCartsModel.fromJson(value.data);
      if (!addOrDeleteCartsItem!.status!) {
        carts[id] = !carts[id]!;
      } else {
        getCartsData();
      }

      emit(AddOrDeleteCartsItemSuccess(addOrDeleteCartsItem));
    }).catchError((error) {
      carts[id] = !carts[id]!;

      emit(AddOrDeleteCartsItemError(error.toString()));
    });
  }

  ChangeCartsModel? updateItemCart;
  void updateItemCarts({
    required int id,
    required int quantity,
  }) {
    emit(UpdateCartsItemLoading());

    DioHelper.putData(url: '$CARTS/ ${id.toString()}', token: token, data: {
      'quantity': quantity,
    }).then((value) {
      updateItemCart = ChangeCartsModel.fromJson(value.data);
      if (kDebugMode) {
        print(updateItemCart!.message);
      }
      if (!updateItemCart!.status!) {
      } else {
        getCartsData();
      }

      emit(UpdateCartsItemSuccess(updateItemCart));
    }).catchError((error) {
      emit(UpdateCartsItemError(error.toString()));
    });
  }

  var counter = 1;
  void increaseCounter() {
    counter++;
    // return counter;
  }

  void decreaseCounter() {
    (counter == 1) ? counter : counter--;
    // counter--;
    // return counter;
  }

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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      : Expanded(child: expectSearch!)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Visibility(
              //   visible: addChild!,
              //   child: child!,
              // ),
              addChild == !false ? child! : SizedBox.shrink(),
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
  bool favt = true;
  void iconChange() {
    favt = !favt;
    fav = favt ? Colors.red : Colors.white;
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

  Map<int, bool> favorites = {};

  HomeModel? homeModel;
  void getHomeData() {
    // print("homeDataModel?.status");
    emit(HomeGetDataLoading());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) async {
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
        carts.addAll({element.id: element.inCart});
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
      categoryProductsModel?.data!.data!.forEach((element) {
        favorites.addAll({element.id!: element.inFavorites!});
        carts.addAll({element.id!: element.inCart!});
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
      // print(profileModel?.data!.phone);
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
      // print(notificationModel!.data!.firstPageUrl);
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
      emit(FavoritesDataSuccess());
    }).catchError((error) {
      emit(FavoritesDataError(error.toString()));
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void addOrDeleteFavorites({
    required int id,
  }) {
    emit(ChangeFavoritesSuccess());
    favorites[id] = !favorites[id]!;
    DioHelper.postsData(url: FAVORITES, token: token, data: {
      'product_id': id,
    }).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      // print(favorites);
      if (!changeFavoritesModel!.status!) {
        favorites[id] = !favorites[id]!;
      } else {
        getFavoritesData();
      }

      emit(AddOrDeleteFavoritesSuccess(changeFavoritesModel));
    }).catchError((error) {
      favorites[id] = !favorites[id]!;

      emit(AddOrDeleteFavoritesError(error.toString()));
    });
  }

  ProductDetailsModel? productDetailsModel;
  void getProductDataById(int? id, context) {
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
