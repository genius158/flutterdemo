import 'package:flutter/material.dart';
import '../data/list_data.dart';

class ListItem extends StatelessWidget {
  final ListData ld;

  ListItem(this.ld);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.only(bottom: 1.0),
        padding: EdgeInsets.all(10.0),
        color: const Color(0xfff1f1f1),
        child: new Row(
          children: <Widget>[
            new Text(
              ld.testData,
              style: const TextStyle(
                color: const Color(0xff666666),
              ),
              textAlign: TextAlign.center,
            ),
            new Expanded(
              child: new Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new TextField(
                    decoration: new InputDecoration(hintText: "test 测试"),
                    onChanged: (str) {
                      print("TextField onChanged    " + str);
                    },
                    onSubmitted: (str) {
                      print("TextField onSubmitted    " + str);
                    },
                  )),
            )
          ],
        ));
  }
}
