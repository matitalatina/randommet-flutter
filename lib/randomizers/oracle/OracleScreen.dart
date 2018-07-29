import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OracleScreen extends StatelessWidget {
  final String title;
  final String response;
  final Function onChangeResponse;

  final Animation animationController;
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
            scale: Tween(begin: 1.0, end: 0.0).animate(new CurvedAnimation(
                parent: animationController, curve: Curves.elasticIn
            )),
            child: new Text(
              response,
              style: new TextStyle(fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
      backgroundColor: backgroundColor,
      floatingActionButton: new FloatingActionButton(
        onPressed: onChangeResponse,
        tooltip: 'New Response',
        child: new Icon(Icons.shuffle),
      ),
    );
  }

  OracleScreen(
      {@required this.response,
      @required this.onChangeResponse,
      @required this.animationController,
      @required this.backgroundColor,
      @required this.title});
}
