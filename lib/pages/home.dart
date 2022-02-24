import 'package:dd_blog_macos/pages/category/category.dart';
import 'package:dd_blog_macos/pages/index/index.dart';
import 'package:dd_blog_macos/pages/tag/tag.dart';
import 'package:dd_blog_macos/widgets/menu_buttom.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'archive/archive.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _current = 0;

  final List<Widget> _pages = [
    const IndexPage(),
    const ArchivePage(),
    const TagPage(),
    const CategoryPage()
  ];

  final List<SidebarItem> _menus = [
    const SidebarItem(
        label: Text('首页'), leading: MacosIcon(CupertinoIcons.home)),
    const SidebarItem(
        label: Text('归档'), leading: MacosIcon(CupertinoIcons.calendar)),
    const SidebarItem(
        label: Text('标签'), leading: MacosIcon(CupertinoIcons.tag)),
    const SidebarItem(
        label: Text('分类'), leading: MacosIcon(CupertinoIcons.archivebox))
  ];

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      child: IndexedStack(
        index: _current,
        children: _pages,
      ),
      sidebar: Sidebar(
          minWidth: 200,
          builder: (BuildContext context, ScrollController scrollController) {
            return SidebarItems(
                currentIndex: _current,
                onChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items: _menus);
          },
          bottom: const MenuBottom()),
    );
  }
}
