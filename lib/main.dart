import 'package:flutter/material.dart';
import 'package:flutter_app/randomizers/color/ColorContainer.dart';
import 'package:flutter_app/randomizers/oracle/OracleContainer.dart';

void main() => runApp(new MyApp());

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
      primarySwatch: Colors.purple,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.remove_red_eye)),
              Tab(icon: Icon(Icons.color_lens)),
            ],
            labelColor: theme.accentColor,
          ),
          body: TabBarView(children: [
            OracleContainer(),
            ColorContainer(),
          ]),
        ),
      ),
    );
  }
}
