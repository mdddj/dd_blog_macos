

import 'package:dataoke_sdk/apis/apis.dart';
import 'package:dataoke_sdk/blog/blog_model.dart';
import 'package:dataoke_sdk/v2/dio_base_api.dart';
import 'package:dd_check_plugin/model/doc_message.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final blogIndexProvider = StateNotifierProvider<IndexProvider,List<Blog>>((ref){
  return IndexProvider(ref);
});

///首页数据仓库
class IndexProvider extends StateNotifier<List<Blog>>{
  IndexProvider(this.ref) : super([]);

  Ref ref;
  int page = 1;


  Future<void> _loadData(int p) async {
    var blogListApi = BlogListApi();
    blogListApi.page = page;
    blogListApi.pageSize = 10;
    final result = await blogListApi.request();
    if(result?.success == true) {
      final list = result!.data['list'] as List<dynamic>;
      final blogs = list.parseObj<Blog>((originMap) => Blog.fromJson(originMap));
      state.addAll(blogs);
    }
  }


  @Doc(message: "刷新首页博客列表")
  Future<void> refresh() async {
    page = 1;
    state.clear();
    _loadData(page);
  }

  @Doc(message: "加载下一页数据")
  Future<void> nextPage() async {
    page++;
    await _loadData(page);
  }

}