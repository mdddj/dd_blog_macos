

import 'package:dataoke_sdk/blog/blog_service.dart';
import 'package:riverpod/riverpod.dart';

final textModelProvider = FutureProvider.autoDispose.family<dynamic,String>((ref,textKey) async {
  return BlogService().getTextModel(textKey);
});