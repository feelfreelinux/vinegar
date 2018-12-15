import 'package:flutter/material.dart';
import 'package:vinegar/screens/screens.dart';
import 'package:vinegar/keys.dart';

class VinegarApp extends StatelessWidget {
  VinegarApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vinegar',
      navigatorKey: VinegarKeys.navKey,
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.blue,
          hintColor: Colors.grey,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.blue),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          )),
      routes: {
        '/': (context) => MainScreen(),
      },
    );
  }
}
