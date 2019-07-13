import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:randommet2/i18n/AppL10nDelegate.dart';
import 'package:randommet2/randomizers/color/ColorVM.dart';
import 'package:randommet2/randomizers/item/ItemVM.dart';
import 'package:randommet2/randomizers/oracle/OracleVM.dart';
import 'package:randommet2/pages/TabsPage.dart';

GetIt getIt = new GetIt();

void main() {
  getIt.registerSingleton<OracleVM>(OracleVM());
  getIt.registerSingleton<ColorVM>(ColorVM());
  getIt.registerSingleton<ItemVM>(ItemVM());
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
      // counter didn't reset back to zero; the application is not restarted.
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
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales){
        getIt<ColorVM>().initialize(locale);
        getIt<OracleVM>().initialize(locale);
      },
    );
  }
}
