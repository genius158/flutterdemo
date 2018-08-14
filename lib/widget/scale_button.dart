import 'package:flutter/material.dart';

class ScaleButton extends StatefulWidget {
  final String text;

  ScaleButton(this.text, {Key key}) : super(key: key);

  @override
  ScaleButtonStatue createState() => new ScaleButtonStatue(text);
}

class ScaleButtonStatue extends State<ScaleButton>
    with TickerProviderStateMixin {
  ScaleButtonStatue(this.text) : super();

  String text;
  AnimationController animationController;
  Animation<double> animation;

  final double aniStart = 1.0;
  final double aniEnd = 1.5;

  double fontSizeScale = 1.0;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = new Tween<double>(begin: aniStart, end: aniEnd)
        .animate(animationController);
    animation.addListener(onScaleChangeBack);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Text(
        text,
        style: new TextStyle(fontSize: 16 * fontSizeScale),
      ),
      onTapDown: (tab) {
        animationTrigger(true);
      },
      onTapUp: (tab) {
        animationTrigger(false);
      },
      onTapCancel: () {
        animationTrigger(false);
      },
    );
  }

  void animationTrigger(bool isTrigger) {
    if (isTrigger) {
      animationController.repeat();
    } else {
      animationController.stop();
    }
  }

  void onScaleChangeBack() {
    setState(() {
      fontSizeScale = animation.value;
    });
    print("value   " + fontSizeScale.toString());
  }
}
