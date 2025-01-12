import 'package:flutter/material.dart';
import 'package:greattube/webview.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WebViewApp(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}