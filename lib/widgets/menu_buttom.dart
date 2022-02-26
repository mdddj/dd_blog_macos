import 'package:dd_blog_macos/component/login.dart';
import 'package:dd_blog_macos/providers/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class MenuBottom extends StatefulHookConsumerWidget {
  const MenuBottom({Key? key}) : super(key: key);

  @override
  ConsumerState<MenuBottom> createState() => _MenuBottomState();
}

class _MenuBottomState extends ConsumerState<MenuBottom> {

  @override
  void initState() {
    super.initState();
    ref.read(userProvider).tryAppLanuchLogin();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).user;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MacosListTile(
        leading: const MacosIcon(CupertinoIcons.profile_circled),
        title:AnimatedSwitcher(
          duration:const Duration(seconds: 1),
          child: user != null ? Text('已登录:'+user.nickName) : const Text('未登录'),
        ),
        subtitle: AnimatedSwitcher(
          duration:const Duration(seconds: 1),
          child: user == null ? const Text('梁典典的博客') :  Text('@${user.loginNumber}'),
        ),
        onClick: () {
          if(user==null){
            showMacosSheet(
              context: context,
              builder: (BuildContext context) {
                return const LoginComponent();
              },
            );
          }
        },
      ),
    );
  }
}
