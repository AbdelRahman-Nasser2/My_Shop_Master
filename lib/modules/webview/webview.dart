import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//webview
class WebviewScrean extends StatelessWidget {
  final String ulr;

  WebviewScrean(this.ulr);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: ulr,
      ),
    );
  }
}
