import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_background/animated_background.dart';
import 'package:randommet2/i18n/AppL10n.dart';

class ChooseScreen extends StatelessWidget {
  final String title;
  final String response;
  final Function onChangeResponse;
  final TickerProvider tickerProvider;

  final Animation<double> animation;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final textColor =
        backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        elevation: 1.0,
      ),
      body: new Stack(children: [
        new Center(
            child: new AnimatedContainer(
                duration: new Duration(milliseconds: 300),
                color: backgroundColor)),
        new Center(
            child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              options: ParticleOptions().copyWith(
            baseColor: textColor,
            minOpacity: 0.05,
            maxOpacity: 0.2,
            particleCount: 40,
          )),
          vsync: tickerProvider,
          child: new Container(),
        )),
        new Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new ScaleTransition(
            scale: animation,
            child: new Text(
              response,
              style: new TextStyle(fontSize: 30.0, color: textColor),
              textAlign: TextAlign.center,
            ),
          ),
        )),
      ]),
      floatingActionButton: new FloatingActionButton(
        onPressed: onChangeResponse,
        tooltip: AppL10n.of(context).chooseScreenChooseTooltip,
        child: new Icon(Icons.shuffle),
      ),
    );
  }

  ChooseScreen({
    @required this.response,
    @required this.onChangeResponse,
    @required this.animation,
    @required this.backgroundColor,
    @required this.title,
    @required this.tickerProvider,
  });
}
