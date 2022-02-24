
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      titleBar: TitleBar(title: Text('分类'),),
    );
  }
}
