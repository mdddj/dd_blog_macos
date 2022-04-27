import 'package:flutter/cupertino.dart';

extension FunExt on Widget {
  Widget click(VoidCallback? callback){
    return GestureDetector(
      onTap: callback,
      child: this,
    );
  }
}