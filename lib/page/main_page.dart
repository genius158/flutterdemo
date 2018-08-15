import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/main_store.dart';
import 'package:flutter_app/theme_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../widget/scale_button.dart';
import './main_page_list.dart';
import '../widget/banner_view.dart';

class MainTab extends StatefulWidget {
  VoidCallback onThemeChange;

  MainTab({Key key, this.onThemeChange}) : super(key: key);

  @override
  MainTabStatue createState() => new MainTabStatue();
}

class MainTabStatue extends State<MainTab> with AutomaticKeepAliveClientMixin {
  var text = "wait";

  int indicatorIndexTest = 1;

  BannerView bannerView;
  RefreshIndicator refreshIndicator;
  ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = new ScrollController();
    bannerView = new BannerView(getBanner(),
        intervalDuration: const Duration(seconds: 4),
        animationDuration: const Duration(milliseconds: 250),
        onPageChanged: (page) {
      onPageChanged(page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return getMainLayout();
  }

  getMainLayout() {
    return new Scaffold(
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Stack(
              alignment: new Alignment(1.0, 1.0),
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  child: bannerView,
                  height: 120.0,
                  width: double.infinity,
                ),
                new Opacity(
                  opacity: 0.7,
                  child: new Card(
                    child: new Container(
                      padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                      child: new Text(indicatorIndexTest.toString()),
                    ),
                  ),
                ),
              ],
            ),
            new Container(
              padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      "漫画女孩",
                      style: new TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  getButtonWrapStore(),
//                  new IconButton(
//                    icon: new Icon(
//                      Icons.more_horiz,
//                      color: Colors.white,
//                    ),
//                    onPressed: () {
////                      widget.onThemeChange();
//                      StoreProvider.of<MainState>(context)
//                          .dispatch(new RefreshThemeDataAction(Colors.amber));
//                      onMoreClick(new AlertDialog(
//                        content: new Text(
//                          "CLICKED MORE",
//                          textAlign: TextAlign.center,
//                        ),
//                      ));
//                    },
//                  ),
                ],
              ),
              color: Theme.of(context).primaryColor,
            ),
            new ScaleButton(" please thouch me "),
            new Expanded(
              child: new RefreshIndicator(
                  child: new PageList(
                    scrollController: scrollController,
                  ),
                  onRefresh: () {
                    return refreshData();
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        foregroundColor: Colors.white,
        onPressed: () {},
        child: new Icon(
          Icons.directions_car,
        ),
      ),
    );
  }

  void onMoreClick(Widget child) {
    showDialog<Null>(
        context: context, builder: (BuildContext context) => child);
  }

  void onPageChanged(page) {
    setState(() {
      indicatorIndexTest = (page - 1) % 3 + 1;
    });
  }

  @override
  bool get wantKeepAlive => true;

  List<Widget> getBanner() {
    return [
      new GestureDetector(
        onTap: () {
          onTap(0);
        },
        child: new Image.network(
          "https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=36dddf653a7adab429dd1311eabdd879/09fa513d269759eef3a90c86befb43166c22df86.jpg",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      new GestureDetector(
        onTap: () {
          onTap(1);
        },
        child: new Image.network(
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=697959623,2320060193&fm=27&gp=0.jpg",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      new GestureDetector(
        onTap: () {
          onTap(2);
        },
        child: new Image.network(
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=805587653,2537979335&fm=27&gp=0.jpg",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    ];
  }

  onTap(int i) {
    onMoreClick(new AlertDialog(
      content: new Text(
        "CLICKED BANNER " + i.toString(),
        textAlign: TextAlign.center,
      ),
    ));
  }

  Future<Null> refreshData() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {});
  }

  getButtonWrapStore() {
//    return StoreConnector<MainState, VoidCallback>(
//      converter: (Store<MainState> store) {
//        store.dispatch(RefreshThemeDataAction(Colors.blue));
//      },
//      builder: (BuildContext context, VoidCallback onSave) {
//        return new IconButton(
//          icon: new Icon(
//            Icons.more_horiz,
//            color: Colors.white,
//          ),
//          onPressed: () {
//            onSave();
//            onMoreClick(new AlertDialog(
//              content: new Text(
//                "CLICKED MORE",
//                textAlign: TextAlign.center,
//              ),
//            ));
//          },
//        );
//      },
//    );

    return new IconButton(
      icon: new Icon(
        Icons.more_horiz,
        color: Colors.white,
      ),
      onPressed: () {
        widget.onThemeChange();
        onMoreClick(new AlertDialog(
          content: new Text(
            "CLICKED MORE",
            textAlign: TextAlign.center,
          ),
        ));
      },
    );
  }
}
