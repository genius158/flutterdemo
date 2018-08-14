import 'package:flutter/material.dart';
import 'package:flutter_app/theme_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './page/first.dart';
import './page/second.dart';
import './page/main_page.dart';
import './main_store.dart';

void main() => runApp(new MyApp(
      store: new Store<MainState>(
        mainReducer,
        initialState: new MainState(
          themeData: Colors.blue,
        ),
      ),
    ));

class MyApp extends StatelessWidget {
  Store<MainState> store;

  MyApp({this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new StoreConnector<MainState, MaterialColor>(
            converter: (Store<MainState> sc) {
          return sc.state.themeData;
        }, builder: (BuildContext context, MaterialColor themeColor) {
          return new MaterialApp(
            title: 'Flutter Demo',
            theme: new ThemeData(
              primaryColor: themeColor,
            ),
            routes: <String, WidgetBuilder>{
              '/sub': (BuildContext context) => new MainTab(
                    onThemeChange: () {
                      store.dispatch(new RefreshThemeDataAction(Colors.blue));
                    },
                  ),
            },
            home: new MyHomePage(
              title: 'Flutter Demo Home Page',
              store: store,
            ),
          );
        }));
  }
}

class MyHomePage extends StatefulWidget {
  Store<MainState> store;

  MyHomePage({Key key, this.title, this.store}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
    controller.addListener(tabClick);
  }

  void tabClick() {
    print("value    " + controller.index.toString());
    if (controller.index == 0) {
      changeTheme(Colors.red);
    }
  }

  void changeTheme(MaterialColor color) {
    StoreProvider.of<MainState>(context)
        .dispatch(new RefreshThemeDataAction(color));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    return new StoreConnector<MainState, MainState>(
//        converter: (Store<MainState> sc) {
//      return sc.state;
//    }, builder: (BuildContext context, MainState themeColor) {
//      return getMainLayout();
//    });

    return getMainLayout();
  }

  getMainLayout() {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[getMainTab(), new FirstTab(), new SecondTab()],
      ),
      bottomNavigationBar: new Material(
          color: Colors.orangeAccent,
          child: new TabBar(
            controller: controller,
            tabs: <Tab>[
              new Tab(text: "main", icon: new Icon(Icons.home)),
              new Tab(text: "tab2", icon: new Icon(Icons.hdr_strong)),
              new Tab(text: "tab3", icon: new Icon(Icons.hdr_weak)),
            ],
          )),
    );
  }

  getMainTab() {
    return new MainTab(
      onThemeChange: () {
        changeTheme(Colors.blue);
      },
    );
  }
}
