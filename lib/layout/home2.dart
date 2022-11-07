import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shop/modules/homelayoutscreens/addproduct/addproduct.dart';
import 'package:shop/modules/homelayoutscreens/favourites/favourits.dart';
import 'package:shop/modules/homelayoutscreens/home/homeScreen.dart';
import 'package:shop/modules/homelayoutscreens/notification/notification.dart';
import 'package:shop/modules/homelayoutscreens/profile/profile.dart';
import 'package:shop/shared/cubit/cubit.dart';
import 'package:shop/shared/cubit/states.dart';

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getHomeData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates states) {},
        builder: (BuildContext context, AppStates states) {
          AppCubit cubit = AppCubit.get(context);
          List<Widget> _buildScreens() {
            return [
              profileScreen(),
              notificationScreen(),
              AddProductScreen(),
              FavouritsScreen(),
              HomeScreen(),
            ];
          }

          List<PersistentBottomNavBarItem> _navBarsItems() {
            return [
              PersistentBottomNavBarItem(
                icon: const Icon(
                  Icons.person,
                ),
                iconSize: 30,
                title: ("الحساب"),
                activeColorPrimary: HexColor("#1E55A2"),
                inactiveColorPrimary: Colors.black,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(
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
                icon: const Icon(
                  Icons.favorite_outlined,
                ),
                iconSize: 30,
                title: ("المفضلة"),
                activeColorPrimary: HexColor("#1E55A2"),
                inactiveColorPrimary: Colors.black,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(
                  Icons.home,
                ),
                iconSize: 30,
                title: ("الرئيسية"),
                activeColorPrimary: HexColor("#1E55A2"),
                inactiveColorPrimary: Colors.black,
              ),
            ];
          }

          PersistentTabController controller;

          controller = PersistentTabController(initialIndex: 4);

          return PersistentTabView(
            context,

            controller: controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: false,
            backgroundColor: Colors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset: true,
            // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows: true,
            // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle:
            NavBarStyle.style15, // Choose the nav bar style with this property.
          );
        },
      ),
    );
  }



}



class HomeLayoutScreen2 extends StatelessWidget {
  const HomeLayoutScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getHomeData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates states) {},
        builder: (BuildContext context, AppStates states) {
          AppCubit cubit = AppCubit.get(context);
          List<Widget> _buildScreens() {
            return [
              profileScreen(),
              notificationScreen(),
              AddProductScreen(),
              FavouritsScreen(),
              HomeScreen(),
            ];
          }

          List<PersistentBottomNavBarItem> _navBarsItems() {
            return [
              PersistentBottomNavBarItem(
                icon: const Icon(
                  Icons.person,
                ),
                iconSize: 30,
                title: ("الحساب"),
                activeColorPrimary: HexColor("#1E55A2"),
                inactiveColorPrimary: Colors.black,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(
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
                icon: const Icon(
                  Icons.favorite_outlined,
                ),
                iconSize: 30,
                title: ("المفضلة"),
                activeColorPrimary: HexColor("#1E55A2"),
                inactiveColorPrimary: Colors.black,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(
                  Icons.home,
                ),
                iconSize: 30,
                title: ("الرئيسية"),
                activeColorPrimary: HexColor("#1E55A2"),
                inactiveColorPrimary: Colors.black,
              ),
            ];
          }

          PersistentTabController controller;

          controller = PersistentTabController(initialIndex: 4);

          return PersistentTabView(
            context,

            controller: controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: false,
            backgroundColor: Colors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset: true,
            // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows: true,
            // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle:
            NavBarStyle.style15, // Choose the nav bar style with this property.
          );
        },
      ),
    );
  }



}







// Widget buildHomeProductItem(CategeoryItemsModel model) => InkWell(
//   onTap: model.onTap,
//   child: Padding(
//     padding: EdgeInsets.symmetric(horizontal: 5),
//     child: Container(
//       width: 135,
//       height: 200,
//       decoration: BoxDecoration(
//         color: Colors.white54,
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(28),
//         boxShadow: [
//           BoxShadow(
//               blurRadius: 2, blurStyle: BlurStyle.outer, spreadRadius: 5)
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(top: 4, right: 2, left: 2),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               height: 110,
//               width: 130,
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 image: DecorationImage(
//                     image: AssetImage(model.pathImage), fit: BoxFit.cover),
//               ),
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 5,
//                       vertical: 5,
//                     ),
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 15,
//                         child: Icon(
//                           Icons.favorite,
//                           color: HexColor("#B8B8B8"),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               model.nameProduct,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 InkWell(
//                     onTap: () {},
//                     child: Stack(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: defaultcolor,
//                           radius: 17,
//                           child: Icon(
//                             Icons.shopping_cart_sharp,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(top: 15, left: 20),
//                           child: Align(
//                             alignment: Alignment.topRight,
//                             child: CircleAvatar(
//                               backgroundColor: HexColor("#F99100"),
//                               radius: 8,
//                               child: Icon(
//                                 Icons.add,
//                                 size: 8,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     )),
//                 Spacer(),
//                 Text(
//                   "جنيه",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   width: 2,
//                 ),
//                 Text(
//                   model.price,
//                   style: TextStyle(
//                       color: HexColor("#F99100"),
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   ),
// );