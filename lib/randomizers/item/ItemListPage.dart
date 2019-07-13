import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:randommet2/i18n/AppL10n.dart';
import 'package:randommet2/main.dart';
import 'package:randommet2/randomizers/item/ChoosePage.dart';
import 'package:randommet2/randomizers/item/ItemVM.dart';
import 'package:rxdart/rxdart.dart';

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final _formKey = GlobalKey<FormState>();
  final ItemVM itemVM = getIt<ItemVM>();
  final TextEditingController _textController = new TextEditingController();
  final BehaviorSubject<String> _itemInputValue$ = BehaviorSubject.seeded('');

  @override
  void initState() {
    super.initState();
    _textController
        .addListener(() => _itemInputValue$.add(_textController.text));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context);
    final iconTrashBack = Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ));
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Item"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: l10n.itemListPageAddTooltip,
            onPressed: _submitItem,
          )
        ],
        elevation: 1.0,
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 32.0),
                  child: TextFormField(
                    controller: _textController,
                    decoration: InputDecoration(
                        labelText: l10n.itemListPageAddPlaceholder,
                        hasFloatingPlaceholder: true,
                        icon: Icon(Icons.chevron_right),
                        contentPadding: EdgeInsets.all(16.0),
                        suffixIcon: StreamBuilder(
                          stream: _itemInputValue$.stream,
                          initialData: '',
                          builder: (context, snap) {
                            return snap.data.length > 0
                                ? IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: _clearItemInput)
                                : Container(width: 0.0, height: 0.0,);
                          },
                        )),
                    validator: _validateItemName(context),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: _submitItem,
                  )),
              Expanded(
                  child: StreamBuilder<ItemState>(
                initialData: ItemVM.initialState,
                stream: itemVM.state,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  return ListView.builder(
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        final item = state.list[index];
                        return Dismissible(
                            key: Key(item.id),
                            background: Stack(fit: StackFit.expand, children: [
                              Container(color: Colors.red),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    iconTrashBack,
                                    iconTrashBack,
                                  ])
                            ]),
                            onDismissed: (d) => _onDeleteItem(item.id),
                            child: ListTile(
                                title: Text(item.name),
                                trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () => _onDeleteItem(item.id))));
                      });
                },
              ))
            ],
          )),
      floatingActionButton: StreamBuilder<List<Item>>(
          initialData: [],
          stream: itemVM.state.map((s) => s.list),
          builder: (context, snap) => snap.data.length > 0
              ? FloatingActionButton(
                  onPressed: () => _showChooseScreen(context),
                  tooltip: l10n.itemListPageChooseTooltip,
                  child: Icon(Icons.shuffle),
                )
              : Container(
                  width: 0.0,
                  height: 0.0,
                )),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submitItem() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      itemVM.add(Item(name: _textController.value.text));
      _clearItemInput();
    }
  }

  void _clearItemInput() {
    setState(() {
      _textController.clear();
    });
  }

  void _onDeleteItem(String key) {
    itemVM.remove(key);
  }

   ValueChanged<String> _validateItemName(BuildContext context) {
    return (value) {
      if (value.isEmpty) {
        return AppL10n.of(context).itemListPageChooseEmptyTextError;
      }

      return null;
    };
  }

  _showChooseScreen(BuildContext context) {
    itemVM.choose();
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChoosePage(),
        ));
  }
}
