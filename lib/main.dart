import 'package:dataoke_sdk/dd_taoke_sdk.dart';
import 'package:dataoke_sdk/network/util.dart';
import 'package:dd_blog_macos/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  DdTaokeUtil().init('https://itbug.shop', '443');
  runApp(const ProviderScope(child: MyApp()));
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
