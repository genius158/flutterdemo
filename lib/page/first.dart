import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:flutter_app/page/main_page.dart';

class FirstTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FirstTabStatue();
}

class FirstTabStatue extends State<FirstTab>  with AutomaticKeepAliveClientMixin{
  var text = "wait";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("tab1"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new IconButton(
                icon: new Icon(Icons.map),
                onPressed: () {
                  Navigator
                      .of(context)
                      .push(new MaterialPageRoute(builder: (_) {
                    return new MainTab();
                  }));
                }),
            new Text("line1"),
            new Text(
              text,
              textAlign: TextAlign.center,
            ),
            new Align(
              alignment: Alignment.center,
              child: new Text("Align"),
            ),
            new Padding(
              padding: new EdgeInsets.all(1.0),
              child: new Card(
                  child: new Padding(
                      child: const Text('Hello World!'),
                      padding: new EdgeInsets.all(10.0))),
            ),
            new Container(
              color: Colors.amberAccent,
              width: 200.0,
              child: new FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.topLeft,
                child: new Container(
                  color: Colors.red,
                  child: new Text("FittedBox"),
                ),
              ),
            ),
            new Container(
              width: 100.0,
              child: new AspectRatio(
                aspectRatio: 1.5,
                child: new Container(
                  color: Colors.red,
                ),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Baseline(
                  baseline: 50.0,
                  baselineType: TextBaseline.alphabetic,
                  child: new Text(
                    'test',
                    style: new TextStyle(
                      fontSize: 20.0,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ),
                new Baseline(
                  baseline: 50.0,
                  baselineType: TextBaseline.alphabetic,
                  child: new Container(
                    width: 30.0,
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                new Baseline(
                  baseline: 50.0,
                  baselineType: TextBaseline.alphabetic,
                  child: new Text(
                    'TEST',
                    style: new TextStyle(
                      fontSize: 35.0,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getData() async {
    var url = "http://baidu.com";

    get(url).then((Response response) {
      if (!isDispose) {
        setState(() {
          text = response.body;
        });
      }
    });
  }

  bool isDispose = false;

  @override
  void dispose() {
    super.dispose();
    isDispose = true;
  }

  @override
  void initState() {
    super.initState();
    isDispose = true;
    getData();
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}
