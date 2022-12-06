import 'package:flutter/material.dart';

class WebViewScreen extends StatelessWidget {
  final String ulr;

  const WebViewScreen(this.ulr, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Container()

        // WebView(
        //   initialUrl: ulr,
        // ),
        );
  }
}
