import 'package:dd_blog_macos/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MacosApp(
      title: '梁典典的博客',
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
