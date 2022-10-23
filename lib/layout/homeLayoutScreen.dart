// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shop/modules/homelayoutscreens/addproduct/addproduct.dart';
import 'package:shop/modules/homelayoutscreens/favourites/favourits.dart';
import 'package:shop/modules/homelayoutscreens/home/homeScreen.dart';
import 'package:shop/modules/homelayoutscreens/notification/notification.dart';
import 'package:shop/modules/homelayoutscreens/profile/profile.dart';


// class HomeLayoutScreen extends StatefulWidget {
//   const HomeLayoutScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
// }
//
// class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
//   var pageViewController = PageController(initialPage: 0);
//   int currentIndex = 3;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }






//
class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

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
          activeColorPrimary: HexColor("#1E55A2"),
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
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );

//       Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: CircleAvatar(
//         backgroundColor: Colors.white,
//         radius: 32,
//         child: FloatingActionButton(
// // elevation: 0,
//           backgroundColor: Colors.grey[300],
//           onPressed: () {
//             navigateTo(context, AddProductScreen());
//           },
//           child: Icon(
//             Icons.camera_alt,
//             size: 40,
//             color: HexColor("#F99100"),
//           ),
//         ),
//       ),
//       bottomNavigationBar:
//       body: PageView(
//         children: screens,
//         onPageChanged: onPageChanged,
//         controller: pageview,
//         physics: NeverScrollableScrollPhysics(),
//       ),
//     );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
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
