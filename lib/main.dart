import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:randommet2/i18n/AppL10nDelegate.dart';
import 'package:randommet2/pages/TabsPage.dart';
import 'package:randommet2/randomizers/color/ColorVM.dart';
import 'package:randommet2/randomizers/item/ItemVM.dart';
import 'package:randommet2/randomizers/oracle/OracleVM.dart';

GetIt getIt = new GetIt();
FirebaseAnalytics analytics = FirebaseAnalytics();

void main() {
  getIt.registerSingleton<OracleVM>(OracleVM());
  getIt.registerSingleton<ColorVM>(ColorVM());
  getIt.registerSingleton<ItemVM>(ItemVM());
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData(
      primarySwatch: Colors.blue,
    );
    return MaterialApp(
      title: 'RandomMet',
      theme: theme,
      home: TabsPage(),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('it', ''),
      ],
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
