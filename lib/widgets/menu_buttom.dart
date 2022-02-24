import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: MacosListTile(
        leading: const MacosIcon(CupertinoIcons.profile_circled),
        title: const Text('未登录'),
        subtitle: Text('梁典典的博客'),
      ),
    );
  }
}
