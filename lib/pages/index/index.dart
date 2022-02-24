import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';


class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      titleBar: TitleBar(title: Text('首页'),),
    );
  }
}
