import 'package:dd_blog_macos/component/i_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

//登录组件
class LoginComponent extends StatefulWidget {
  const LoginComponent({Key? key}) : super(key: key);

  @override
  _LoginComponentState createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
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
                color: Colors.black
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ITitle(title: '登录'),
                  const CupertinoTextField(placeholder: '用户名',),
                  const SizedBox(height: 12,),
                  const CupertinoTextField(placeholder: '密码',),
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
                        onPressed: () {
                        },
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
