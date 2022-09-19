// //
// //
// //
// // Stack(
// // children: [
// // AppBar(
// // systemOverlayStyle: SystemUiOverlayStyle(
// // systemNavigationBarColor: Colors.black,
// // statusBarColor: HexColor("#1E55A2"),
// // statusBarIconBrightness: Brightness.dark,
// // statusBarBrightness: Brightness.dark),
// // backgroundColor: HexColor("#1E55A2"),
// // toolbarHeight: 100,
// // shape: UnderlineInputBorder(
// // borderRadius: BorderRadius.only(
// // bottomLeft: Radius.circular(40),
// // bottomRight: Radius.circular(40),
// // ),
// // borderSide: BorderSide(width: 0, color: HexColor("#1E55A2"))),
// // shadowColor: HexColor('#1E55A2'),
// // title: Container(
// // decoration: BoxDecoration(
// // shape: BoxShape.circle,
// // color: Colors.white,
// // ),
// // child: IconButton(
// // iconSize: 38,
// // onPressed: () {},
// // icon: Icon(
// // Icons.shopping_cart,
// // color: HexColor("#F99100"),
// // ),
// // ),
// // ),
// // automaticallyImplyLeading: false,
// //
// // // leading: Container(
// // //   decoration: BoxDecoration(
// // //     shape: BoxShape.circle,
// // //     color: Colors.white,
// // //   ),
// // //   child: IconButton(
// // //     iconSize: 38,
// // //     onPressed: () {},
// // //     icon: Icon(
// // //       Icons.shopping_cart,
// // //       color: HexColor("#F99100"),
// // //     ),
// // //   ),
// // // ),
// // elevation: 10,
// // ),
// // Align(
// // alignment: AlignmentDirectional(1, 15),
// // child: Container(
// // height: 100,
// // // alignment: Alignment.bottomCenter,
// // child: PageView(
// // controller: pageViewController,
// // scrollDirection: Axis.horizontal,
// // children: [
// // SvgPicture.asset('assets/images/icons&logos/BrandLogo.svg'),
// // SvgPicture.asset('assets/images/icons&logos/BrandLogo.svg'),
// // ],
// // ),
// // ),
// // ),
// // Align(
// // alignment: Alignment.bottomCenter,
// // child: SmoothPageIndicator(
// // controller: pageViewController,
// // count: 3,
// // axisDirection: Axis.horizontal,
// // onDotClicked: (i) {
// // pageViewController.animateToPage(
// // i,
// // duration: Duration(milliseconds: 500),
// // curve: Curves.ease,
// // );
// // },
// // effect: ExpandingDotsEffect(
// // expansionFactor: 2,
// // spacing: 8,
// // radius: 16,
// // dotWidth: 16,
// // dotHeight: 16,
// // dotColor: Color(0xFF9E9E9E),
// // activeDotColor: Color(0xFF3F51B5),
// // paintStyle: PaintingStyle.fill,
// // ),
// // ),
// // )
// // ],
// // ),
//
// // ignore_for_file: prefer_const_literals_to_create_immutables
//
// import 'package:flutter/material.dart';
// import 'package:shop/modules/homelayoutscreens/home/homeScreen.dart';
//
// void main() => runApp(MyApp());
//
// /// This Widget is the main application widget.
// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter App';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: App(),
//     );
//   }
// }
//
// class App extends StatefulWidget {
//   App({Key? key}) : super(key: key);
//   _AppState createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//   late PageController _myPage;
//   var selectedPage;
//
//   @override
//   void initState() {
//     super.initState();
//     _myPage = PageController(initialPage: 1);
//     selectedPage = 1;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: PageView(
//           physics: NeverScrollableScrollPhysics(),
//           controller: _myPage,
//           children: <Widget>[
//             HomeScreen(),
//             Center(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text("Page 1"),
//                 RaisedButton(
//                   onPressed: () {
//                     _myPage.jumpToPage(0);
//                     setState(() {
//                       selectedPage = 0;
//                     });
//                   },
//                   child: Text("Go to another page"),
//                 )
//               ],
//             )),
//             Center(child: Text("Page 2")),
//             Center(child: Text("Page 3")),
//           ],
//         ),
//         bottomNavigationBar: BottomAppBar(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.home),
//                 color: selectedPage == 0 ? Colors.blue : Colors.grey,
//                 onPressed: () {
//                   _myPage.jumpToPage(0);
//                   setState(() {
//                     selectedPage = 1;
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.star),
//                 color: selectedPage == 2 ? Colors.blue : Colors.grey,
//                 onPressed: () {
//                   _myPage.jumpToPage(2);
//                   setState(() {
//                     selectedPage = 2;
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.settings,
//                 ),
//                 color: selectedPage == 3 ? Colors.blue : Colors.grey,
//                 onPressed: () {
//                   _myPage.jumpToPage(3);
//                   setState(() {
//                     selectedPage = 3;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ));
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:hexcolor/hexcolor.dart';
// //
// // class Test extends StatefulWidget {
// //   const Test({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Test> createState() => _TestState();
// // }
// //
// // class _TestState extends State<Test> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: PreferredSize(
// //         preferredSize: Size.zero,
// //         child: Stack(
// //           children: [
// //             AppBar(
// //               systemOverlayStyle: SystemUiOverlayStyle(
// //                   systemNavigationBarColor: Colors.black,
// //                   statusBarColor: HexColor("#1E55A2"),
// //                   statusBarIconBrightness: Brightness.dark,
// //                   statusBarBrightness: Brightness.dark),
// //               backgroundColor: HexColor("#1E55A2"),
// //               toolbarHeight: 100,
// //               shape: UnderlineInputBorder(
// //                   borderRadius: BorderRadius.only(
// //                     bottomLeft: Radius.circular(40),
// //                     bottomRight: Radius.circular(40),
// //                   ),
// //                   borderSide: BorderSide(width: 0, color: HexColor("#1E55A2"))),
// //               shadowColor: HexColor('#1E55A2'),
// //               title: Container(
// //                 decoration: BoxDecoration(
// //                   shape: BoxShape.circle,
// //                   color: Colors.white,
// //                 ),
// //                 child: IconButton(
// //                   iconSize: 38,
// //                   onPressed: () {},
// //                   icon: Icon(
// //                     Icons.shopping_cart,
// //                     color: HexColor("#F99100"),
// //                   ),
// //                 ),
// //               ),
// //               automaticallyImplyLeading: false,
// //
// //               // leading: Container(
// //               //   decoration: BoxDecoration(
// //               //     shape: BoxShape.circle,
// //               //     color: Colors.white,
// //               //   ),
// //               //   child: IconButton(
// //               //     iconSize: 38,
// //               //     onPressed: () {},
// //               //     icon: Icon(
// //               //       Icons.shopping_cart,
// //               //       color: HexColor("#F99100"),
// //               //     ),
// //               //   ),
// //               // ),
// //               elevation: 10,
// //             ),
// //             Align(
// //                 alignment: Alignment.bottomCenter,
// //                 child: Container(
// //                     // child: SvgPicture.asset("assets/images/Credit card-bro.svg")),
// //                     ))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
