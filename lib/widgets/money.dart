

import 'dart:convert';

import 'package:dd_blog_macos/providers/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoneyWidget extends ConsumerWidget {
  const MoneyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(textModelProvider("blog-ds"));
    return response.when(data: (d){
      final json = jsonDecode(d);
      return Container(
        child: Markdown(data: json['context'],shrinkWrap: true,),
      );
    }, error: (e,s){
      return Text('出错了:$e');
    }, loading: ()=>const CupertinoActivityIndicator());
  }

}