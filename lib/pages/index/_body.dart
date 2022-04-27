import 'package:dataoke_sdk/blog/blog_model.dart';
import 'package:dd_blog_macos/pages/detail/index.dart';
import 'package:dd_blog_macos/pages/index/_provider.dart';
import 'package:dd_blog_macos/util/util.dart';
import 'package:dd_check_plugin/model/doc_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

/// 首页博客列表
class IndexBodyWidget extends ConsumerWidget {
  final ScrollController? scrollController;
  const IndexBodyWidget({Key? key,this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogs = ref.watch(blogIndexProvider);
    return EasyRefresh.custom(
      scrollController: scrollController,
        firstRefresh: true,
        onRefresh: ref.read(blogIndexProvider.notifier).refresh,
        onLoad: ref.read(blogIndexProvider.notifier).nextPage,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(12),
            sliver: SliverWaterfallFlow.count(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 2,
              children: blogs.map((e)=>_renderItem(context, e)).toList(),
            ),
          )
        ]);
  }

  @Doc(message: "渲染单个博客布局")
  Widget _renderItem(BuildContext context,Blog blog) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _tag(blog.category.name),
            const SizedBox(
              height: 5,
            ),
            Text(blog.title),
            const SizedBox(
              height: 5,
            ),
            Wrap(
              runSpacing: 6,
              spacing: 6,
              children: [

                ...blog.tags.map((e) => _tag(e.name)).toList()
              ],
            )
          ],
        ),
      ),
    ).click(()=>BlogDetailPage.nav(context,blog: blog));
  }

  @Doc(message: "标签&&分类")
  Widget _tag(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey,fontSize: 12),
    );
  }
}
