import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

class Item {
  final String id;
  final String name;

  Item({this.id, this.name});
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
    final newItem = Item(
      id: new Uuid().v1(),
      name: item.name,
    );
    final newState = ItemState(
      list: currentState.list..add(newItem),
      chosen: currentState.chosen,
    );
    _stateSubject.add(newState);
  }

  remove(String key) {
    final list = currentState.list..remove(currentState.list.firstWhere((i) => i.id == key));
    final newState = ItemState(
      list: list,
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