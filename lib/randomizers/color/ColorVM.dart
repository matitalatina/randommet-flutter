import 'package:randommet2/randomizers/color/ColorRandomizer.dart';
import 'package:randommet2/randomizers/color/NamedColor.dart';
import 'package:rxdart/rxdart.dart';

class ColorState {
  final NamedColor chosen;

  ColorState({this.chosen});
}

class ColorVM {
  static final initialState = ColorState(chosen: ColorRandomizer.getColor());
  BehaviorSubject<ColorState> _stateSubject = BehaviorSubject.seeded(initialState);
  Observable<ColorState> get state$ => _stateSubject.stream;

  choose() {
    _stateSubject.add(ColorState(chosen: ColorRandomizer.getColor()));
  }

}