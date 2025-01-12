import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {

  @override
  void initState() {
    super.initState();
    controller = _createController()
      ..loadRequest(Uri.parse('https://youtube.com'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GreatTube"),
        backgroundColor: bgcol,
        foregroundColor: fgcol,
        centerTitle: false,
        toolbarHeight: 40,
        actions: [ NavigationControls(controller: controller) ],
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
        ],
      ),
    );
  }
