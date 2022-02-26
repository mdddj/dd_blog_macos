import 'package:dd_blog_macos/component/i_title.dart';
import 'package:dd_blog_macos/providers/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

//登录组件
class LoginComponent extends StatefulHookConsumerWidget {
  const LoginComponent({Key? key}) : super(key: key);

  @override
  _LoginComponentState createState() => _LoginComponentState();
}

class _LoginComponentState extends ConsumerState<LoginComponent> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String get getUsernam => _username.text;
  String get getPassword => _password.text;

  //执行登录
void _login(){
  ref.read(userProvider).doLogin(getUsernam, getPassword);
}


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: Container(
              width: 400,
              height: 300,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ITitle(title: '登录'),
                  MacosTextField(placeholder: '用户名',controller: _username,),
                  const SizedBox(height: 12,),
                  MacosTextField(placeholder: '密码', controller: _password,),
                  const SizedBox(height: 22,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PushButton(
                        child: const Text('关闭'),
                        isSecondary: true,
                        buttonSize: ButtonSize.large,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 12,),
                      PushButton(
                        child: const Text('登录'),
                        buttonSize: ButtonSize.large,
                        onPressed: _login,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
