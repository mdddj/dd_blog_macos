

import 'package:dataoke_sdk/blog/blog_model.dart';
import 'package:dd_check_plugin/model/doc_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:markdown/markdown.dart' hide Text;


class BlogDetailPage extends StatefulWidget {
  final Blog? blog;
  final String? blogId;
  const BlogDetailPage({Key? key,this.blog,this.blogId}) : super(key: key);

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
  
  @Doc(message: "导航到博客详情页面")
  static Future<void> nav(BuildContext context,{Blog? blog,String? blogId}) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_)=>BlogDetailPage(blog: blog,blogId: blogId,)));
  }
}

class _BlogDetailPageState extends State<BlogDetailPage> {

  Blog? get initBlog => widget.blog;

  @Doc(message: "获取页面的标题")
  String getTitle(){
    if(initBlog!=null){
      return initBlog!.title;
    }
    return '';
  }

  String get html => markdownToHtml(initBlog!.content);

  @override
  Widget build(BuildContext context) {

    return MacosScaffold(
      titleBar: TitleBar(centerTitle: false,title: Text(getTitle()),),
      children: [

        ContentArea(
          builder: (context,controller){
            return SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: HtmlWidget(html,));
          },
        )
      ],
    );
  }
}
