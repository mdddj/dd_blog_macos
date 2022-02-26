import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class ITitle extends StatelessWidget {
  final String title;
  final Color color;
  const ITitle({Key? key,required this.title,this.color = MacosColors.appleBlue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(title,style: TextStyle(color: color,fontSize: 30),),
    );
  }
}
