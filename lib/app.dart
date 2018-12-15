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
          accentColor: Colors.deepPurple,
          hintColor: Colors.grey,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.deepPurple),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
          )),
      routes: {
        '/': (context) => MainScreen(),
      },
    );
  }
}
