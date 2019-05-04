import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:randommet2/randomizers/color/ColorPage.dart';
import 'package:randommet2/randomizers/item/ItemListPage.dart';
import 'package:randommet2/randomizers/oracle/OraclePage.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.list), text: "List"),
            Tab(icon: Icon(Icons.remove_red_eye), text: "Oracle"),
            Tab(icon: Icon(Icons.color_lens), text: "Color"),
          ],
          labelColor: theme.accentColor,
        ),
        body: TabBarView(children: [
          ItemListPage(),
          OraclePage(),
          ColorPage(),
        ]),
      ),
    );
  }

}