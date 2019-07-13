import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:randommet2/i18n/AppL10n.dart';
import 'package:randommet2/randomizers/oracle/repo/OracleEn.dart';
import 'package:randommet2/randomizers/oracle/repo/OracleIt.dart';
import 'package:rxdart/rxdart.dart';

class OracleState {
  String response;
  Color color;

  OracleState({this.response, this.color});
}

class OracleVM {
  BehaviorSubject<OracleState> _response = BehaviorSubject.seeded(null);
  Observable<OracleState> get response$ => _response.stream;
  bool toggle = false;

  initialize(Locale locale) {
    _response.add(OracleState(response: AppL10n(locale).oracleHelpText, color: Colors.white));
  }

  choose(Locale locale) {
    _response.add(_getNewResponse(locale));
  }

  OracleState _getNewResponse(Locale locale) {
    var responseList = _getResponseList(locale);
    final newState = OracleState(
        response: responseList[new Random().nextInt(responseList.length)],
        color: toggle ? Colors.white : Colors.black
    );
    toggle = !toggle;
    return newState;
  }

  List<String> _getResponseList(Locale locale) {
    return {
      ...oracleEn,
      ...oracleIt,
    }[locale.languageCode].map((e) => e['label']).toList();
  }
}