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
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = _createController()
      ..loadRequest(Uri.parse('https://youtube.com'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(_createNavigationDelegate());
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
          if (loadingPercentage < 100)
            LinearProgressIndicator(value: loadingPercentage / 100.0),
          WebViewWidget(
            controller: controller,
          ),
        ],
      ),

  WebViewController _createController() {
    final params = !(WebViewPlatform.instance is WebKitWebViewPlatform)
      ? const PlatformWebViewControllerCreationParams()
      : WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);

    if (controller.platform is AndroidWebViewController) {
      (controller.platform as AndroidWebViewController)
        .setMediaPlaybackRequiresUserGesture(true);
    }
    return controller;
  }

  NavigationDelegate _createNavigationDelegate() {
    return NavigationDelegate(
      onPageStarted: (_) => setState(() { loadingPercentage = 0; }),
      onProgress: (progress) => setState(() { loadingPercentage = progress; }),
      onPageFinished: (_) => setState(() { loadingPercentage = 100; }),
    );
  }
}
    );
  }
