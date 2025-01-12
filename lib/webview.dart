import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

const Color bgcol = Color(0xff0f0e1b);
const Color fgcol = Color(0xffffffff);

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
    );
  }

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

class NavigationControls extends StatelessWidget {
  const NavigationControls({required this.controller, super.key});
  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () async {
            await controller.loadRequest(Uri.parse("https://www.youtube.com/"));
          },
        ),
        IconButton(
          icon: const Icon(Icons.playlist_play),
          onPressed: () async {
            await controller.loadRequest(Uri.parse("https://www.youtube.com/feed/subscriptions"));
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            if (await controller.canGoBack()) {
              await controller.goBack();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () async {
            if (await controller.canGoForward()) {
              await controller.goForward();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () => controller.reload(),
        ),
      ],
    );
  }
}
