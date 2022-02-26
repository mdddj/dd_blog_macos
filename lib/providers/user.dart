

import 'dart:convert';

import 'package:dataoke_sdk/model/user.dart';
import 'package:dataoke_sdk/public_api.dart';
import 'package:dd_blog_macos/config/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//用户token
final userTokenProvider  = StateProvider<String>((ref)=> '');


//用户状态
final userProvider = ChangeNotifierProvider<UserState>((ref) {
  return UserState(ref);
});

class UserState extends ChangeNotifier {
  UserState(this.ref);
  User? user;

  final Ref ref;

  // 获取token的信息
  void getUser() {
    final token = ref.read(userTokenProvider);
    PublicApi.req.getUser(token).then((value) {
      user = value;
      notifyListeners();
    });
  }

  ///执行登录
  void doLogin(String username,String password) {
    PublicApi.req.login(username, password,tokenHandle: (String resultToken){
      AppConfig().putCatchByAsync(userTokenCatchkey, resultToken);
    _tokenHandle(resultToken);
    },loginFail: (String message){
      print('登录失败');
    });
  }

  void _tokenHandle(String token){
    ref.read(userTokenProvider.notifier).state = token;
    getUser();
  }

  //app启动的时候尝试登录
  void tryAppLanuchLogin() {
    AppConfig().getCatchValue(userTokenCatchkey).then((value) {
      if(value!=null){
        _tokenHandle(value);
      }
    });
  }

}