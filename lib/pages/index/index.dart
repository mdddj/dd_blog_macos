import 'package:dd_check_plugin/model/doc_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../widgets/money.dart';
import '_body.dart';

/// 首页
class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @Doc(message: "下拉刷新")
  Future<void> _refresh() async {}

  @Doc(message: "下拉加载")
  Future<void> _load() async {}

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      titleBar: const TitleBar(
        title: Text('首页'),
      ),
      children: [
        ContentArea(
          builder: (BuildContext context, ScrollController scrollController) {
            return  IndexBodyWidget(scrollController: scrollController,);
          },
        ),
        ResizablePane(
          minWidth: 200,
          startWidth: 200,
          windowBreakpoint: 400,
          resizableSide: ResizableSide.left,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              child: Column(
                children: const [MoneyWidget()],
              ),
            );
          },
        )
      ],
    );
  }
}
