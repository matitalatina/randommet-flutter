import 'dart:math';

import 'package:rxdart/rxdart.dart';

class Item {
  final String name;

  Item({this.name});
}

class ItemState {
  final List<Item> list;
  final Item chosen;

  ItemState({this.list, this.chosen});
}

class ItemVM {
  static ItemState initialState = ItemState(
    list: [],
    chosen: null,
  );

  BehaviorSubject<ItemState> _stateSubject = BehaviorSubject.seeded(initialState);
  Observable<ItemState> get state => _stateSubject.stream;
  ItemState get currentState => _stateSubject.value;

  add(Item item) {
    final newState = ItemState(
      list: currentState.list..add(item),
      chosen: currentState.chosen,
    );
    _stateSubject.add(newState);
  }

  remove(int index) {
    final newState = ItemState(
      list: currentState.list..removeAt(index),
      chosen: currentState.chosen,
    );
    _stateSubject.add(newState);
  }

  choose() {
    final newState = ItemState(
      list: currentState.list,
      chosen: currentState.list[new Random().nextInt(currentState.list.length)],
    );
    _stateSubject.add(newState);
  }
}