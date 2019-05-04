import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class OracleState {
  String response;
  Color color;

  OracleState({this.response, this.color});
}

class OracleVM {
  static final OracleState initialState = OracleState(response: 'Think a question, then ask Oracle the answer!', color: Colors.white);
  BehaviorSubject<OracleState> _response = BehaviorSubject.seeded(initialState);
  Observable<OracleState> get response$ => _response.stream;
  bool toggle = false;

  choose() {
    _response.add(_getNewResponse());
  }

  OracleState _getNewResponse() {
    var responseList = _getResponseList();
    final newState = OracleState(
        response: responseList[new Random().nextInt(responseList.length)],
        color: toggle ? Colors.white : Colors.black
    );
    toggle = !toggle;
    return newState;
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
}