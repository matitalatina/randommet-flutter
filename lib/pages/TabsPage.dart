import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:randommet2/i18n/AppL10n.dart';
import 'package:randommet2/randomizers/color/ColorPage.dart';
import 'package:randommet2/randomizers/item/ItemListPage.dart';
import 'package:randommet2/randomizers/oracle/OraclePage.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppL10n.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.list), text: l10n.tabItem),
            Tab(icon: Icon(Icons.remove_red_eye), text: l10n.tabOracle),
            Tab(icon: Icon(Icons.color_lens), text: l10n.tabColor),
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