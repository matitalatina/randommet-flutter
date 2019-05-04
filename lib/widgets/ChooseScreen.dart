import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChooseScreen extends StatelessWidget {
  final String title;
  final String response;
  final Function onChangeResponse;

  final Animation<double> animation;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        elevation: 1.0,
      ),
      body: new Stack(children: [
        new Center(child: new AnimatedContainer(duration: new Duration(milliseconds: 300), color: backgroundColor)),
        new Center(
          child: new ScaleTransition(
            scale: animation,
            child: new Text(
              response,
              style: new TextStyle(fontSize: 30.0, color: backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
      floatingActionButton: new FloatingActionButton(
        onPressed: onChangeResponse,
        tooltip: 'New Response',
        child: new Icon(Icons.shuffle),
      ),
    );
  }

  ChooseScreen(
      {@required this.response,
      @required this.onChangeResponse,
      @required this.animation,
      @required this.backgroundColor,
      @required this.title});
}
