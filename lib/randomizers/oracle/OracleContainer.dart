import 'dart:math';

import 'package:flutter/material.dart';
import 'package:randommet2/randomizers/oracle/OracleScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OracleContainer extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _OracleContainerState createState() => new _OracleContainerState();
}

class _OracleContainerState extends State<OracleContainer>
    with TickerProviderStateMixin {
  String _chosen = 'Hello!';
  AnimationController animationController;

  final Color backgroundColor1 = Colors.white;
  Color backgroundColor;

  static const String STORAGE_KEY = 'randomizers.oracle';
  static const String CHOSEN_STORAGE_KEY = STORAGE_KEY + '.chosen';
  static const String COLOR_STORAGE_KEY = STORAGE_KEY + '.color';

  _changeResponse(context) {
    return () {
      animationController.forward().then((a) {
        setState(() {
          _chosen = _getNewResponse();
        });
        animationController.reverse();
      });
      setState(() {
        backgroundColor = backgroundColor == backgroundColor1
            ? Theme.of(context).primaryColorLight
            : backgroundColor1;
      });
    };
  }


  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((pref) {
      setState(() {
        backgroundColor = Color(pref.getInt(COLOR_STORAGE_KEY));
        _chosen = pref.get(CHOSEN_STORAGE_KEY);
      });
    });
    animationController = new AnimationController(
      duration: new Duration(milliseconds: 700),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OracleScreen(
      response: this._chosen,
      onChangeResponse: _changeResponse(context),
      animationController: animationController,
      backgroundColor: backgroundColor,
      title: 'Oracle',
    );
  }


  @override
  void dispose() {
    animationController.dispose();
    SharedPreferences.getInstance().then((pref) {
      pref.setInt(COLOR_STORAGE_KEY, backgroundColor.value);
      pref.setString(CHOSEN_STORAGE_KEY, _chosen);
    });
    super.dispose();
  }

  List<String> _getResponseList() {
    return [
      {"label": "Signs point to yes."},
      {"label": "Yes."},
      {"label": "Without a doubt."},
      {"label": "My sources say no."},
      {"label": "As I see it, yes."},
      {"label": "You may rely on it."},
      {"label": "Concentrate and ask again."},
      {"label": "Outlook not so good."},
      {"label": "It is decidedly so."},
      {"label": "Better not tell you now."},
      {"label": "Very doubtful."},
      {"label": "Yes, definitely."},
      {"label": "It is certain."},
      {"label": "Cannot predict now."},
      {"label": "Most likely."},
      {"label": "Ask again later."},
      {"label": "My reply is no."},
      {"label": "Outlook good."},
      {"label": "Don't count on it."},
      {"label": "Yes, in due time."},
      {"label": "My sources say no."},
      {"label": "Definitely not."},
      {"label": "Yes."},
      {"label": "You will have to wait."},
      {"label": "I have my doubts."},
      {"label": "Outlook so so."},
      {"label": "Looks good to me!"},
      {"label": "Who knows?"},
      {"label": "Looking good!"},
      {"label": "Probably."},
      {"label": "Are you kidding?"},
      {"label": "Go for it!"},
      {"label": "Don't bet on it."},
      {"label": "Forget about it."}
    ].map((e) => e['label']).toList();
  }

  String _getNewResponse() {
    var responseList = _getResponseList();
    return responseList[new Random().nextInt(responseList.length)];
  }
}
