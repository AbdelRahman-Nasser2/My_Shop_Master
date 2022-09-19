// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop/shared/cubit/cubit.dart';

class HomePageWidget extends StatefulWidget {
  // const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
// color:Theme.of(context)?Colors.white :HexColor('333739'),
// Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 5)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
//image
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          image: DecorationImage(
                            image: AssetImage("assets/images/clothes.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: 150,
                        height: 120,
                      ),
// SizedBox(
//   height: 5,
// ),

//title
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "gfdcjgf",
                                textDirection: TextDirection.ltr,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                                onPressed: AppCubit.get(context).iconChange,
                                icon: Icon(
                                  Icons.favorite_outline_rounded,
                                  color: AppCubit.get(context).fav,
                                )),
                          ],
                        ),
                      ),

//description
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          "dfgdfgdf",
                          style: Theme.of(context).textTheme.displaySmall,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
