import 'package:hive/hive.dart';

class AppConfig {
  AppConfig._();
  factory AppConfig() => AppConfig._();
  static const catchBox = 'app-config';

  Future<Box<String>> _openDefaultCatchBox() async {
    final box =  await Hive.openBox<String>(catchBox);
    return box;
  }

  ///存储缓存到本地
  void putCatchByAsync(String name, String v) {
    _openDefaultCatchBox().then((value) => value.put(name, v));
  }

  ///读取内容
  Future<String?> getCatchValue(String key) async {
    final box = await _openDefaultCatchBox();
    return box.get(key);
  }
}

const defaultBoxName = AppConfig.catchBox;
const userTokenCatchkey = 'token';