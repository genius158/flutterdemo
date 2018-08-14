import 'package:flutter/material.dart';
import './main_page_list_item.dart';
import '../data/list_data.dart';

class PageList extends StatefulWidget {
  ScrollController scrollController;

  PageList({Key key, this.scrollController}) : super(key: key);

  @override
  PageListStatue createState() => new PageListStatue();
}

class PageListStatue extends State<PageList> with TickerProviderStateMixin {
  PageListStatue() : super();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      controller: widget.scrollController,
      physics: new AlwaysScrollableScrollPhysics(),
      children: loadItems(),
    );
  }
}

List<ListItem> loadItems() {
  const List<ListData> datas = <ListData>[
    const ListData("test1"),
    const ListData("test2"),
    const ListData("test3"),
    const ListData("test4"),
    const ListData("test5"),
    const ListData("test6"),
    const ListData("test7"),
    const ListData("test8"),
    const ListData("test9"),
    const ListData("test10"),
    const ListData("test11"),
    const ListData("test12"),
  ];

  return datas.map((item) => new ListItem(item)).toList();
}
