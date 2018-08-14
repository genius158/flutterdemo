import 'package:flutter/material.dart';

class SecondTab extends StatefulWidget {
  @override
  SecondTabStatue createState() => new SecondTabStatue();
}

class SecondTabStatue extends State<SecondTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("tab2"),
      ),
      body: new Center(
          child: new Container(
        constraints: new BoxConstraints.expand(
          height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
        ),
        decoration: new BoxDecoration(
          border: new Border.all(width: 2.0, color: Colors.red),
          color: Colors.orange,
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          image: new DecorationImage(
            image: new NetworkImage(
                'http://xaya.qiniudn.com/FkGfMa2npAf0JggOdsG0omIom6dM'),
            centerSlice: new Rect.fromLTRB(0.0, 0.0, 1360.0, 720.0),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: new Image.network(
          "https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=36dddf653a7adab429dd1311eabdd879/09fa513d269759eef3a90c86befb43166c22df86.jpg",
          width: double.infinity,
          height: 200.0,
          fit: BoxFit.cover,
        ),
        transform: new Matrix4.rotationZ(0.3),
      )),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}
