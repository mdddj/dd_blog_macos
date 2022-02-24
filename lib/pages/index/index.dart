import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';


class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      titleBar: const TitleBar(title: Text('首页'),),
      children: [
        ContentArea(builder: (BuildContext context, ScrollController scrollController) {
          return ListView.builder(itemBuilder: (BuildContext context, int index) {
            return Container();
          },itemCount: 1,);
        },),
        ResizablePane(minWidth: 200,startWidth: 200, resizableSide: ResizableSide.left, builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            child: Column(
              children: [
                  Text('打赏')
              ],
            ),
          );
        },)
      ],
    );
  }
}
