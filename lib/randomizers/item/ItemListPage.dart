import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:randommet2/main.dart';
import 'package:randommet2/randomizers/item/ItemVM.dart';

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final _formKey = GlobalKey<FormState>();
  String _itemName;
  final ItemVM itemVM = getIt<ItemVM>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List"),
        elevation: 1.0,
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: _validateItemName,
                onSaved: (value) => _itemName = value,
              ),
              Expanded(
                  child: StreamBuilder<ItemState>(
                initialData: ItemVM.initialState,
                stream: itemVM.state,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  print(snapshot.data.list.length);
                  return ListView.builder(
                      itemCount: state.list.length,
                      itemBuilder: (context, index) => ListTile(
                          title: Text(state.list[index].name),
                          trailing: IconButton(
                              icon: Icon(Icons.delete_forever),
                              onPressed: () => _onDeleteItem(index))));
                },
              ))
            ],
          )),
      floatingActionButton: new FloatingActionButton(
        onPressed: _submit,
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      itemVM.add(Item(name: _itemName));
    }
  }

  void _onDeleteItem(int index) {
    itemVM.remove(index);
  }

  String _validateItemName(value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }

    return null;
  }
}
