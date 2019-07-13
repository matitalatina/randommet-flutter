import 'dart:ui';

import 'package:randommet2/randomizers/color/ColorRandomizer.dart';
import 'package:randommet2/randomizers/color/NamedColor.dart';
import 'package:rxdart/rxdart.dart';

class ColorState {
  final NamedColor chosen;

  ColorState({this.chosen});
}

class ColorVM {
  BehaviorSubject<ColorState> _stateSubject = BehaviorSubject.seeded(null);
  Observable<ColorState> get state$ => _stateSubject.stream;

  initialize(Locale locale) {
    choose(locale);
  }

  choose(Locale locale) {
    _stateSubject.add(ColorState(chosen: ColorRandomizer.getColor(locale)));
  }

}